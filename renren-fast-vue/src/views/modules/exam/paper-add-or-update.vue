<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible"
    class="paper_dialog"
    @close="paperDialogClose">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="试卷标题" prop="paperTitle">
      <el-input type="textarea" v-model="dataForm.paperTitle" placeholder="试卷标题"></el-input>
    </el-form-item>
    <div class="line_wrap">
      <el-form-item label="专业" prop="majorId">
        <el-select
          v-model="dataForm.majorId"
          placeholder="请选择"
          style="width:  92%;"
          @change="paperScore = 0">
            <el-option
              v-for="item in majotList"
              :key="item.id"
              :label="item.majorName"
              :value="item.id+''">
            </el-option>
          </el-select>
      </el-form-item>
      <el-form-item label="课程科目" prop="subjectId">
        <el-select
          v-model="dataForm.subjectId"
          @change="subjectChangeHandler"
          placeholder="请选择"
          style="width:  92%;">
            <el-option
              v-for="item in subjectList"
              :key="item.id"
              :label="item.name"
              :value="item.id+''">
            </el-option>
          </el-select>
      </el-form-item>
    </div>
    <el-form-item label="考试日期区间" prop="examDate" label-width="120px">
      <el-date-picker
        v-model="dataForm.examDate"
        type="daterange"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期">
      </el-date-picker>
    </el-form-item>
    <el-form-item label="试卷难度" prop="difficulty" class="start_rating_wrap">
      <StartRating v-model="dataForm.difficulty"/>
    </el-form-item>
    <div v-if="pageQuestions.length" class="select_question_num_wrap">
      <p>试卷总分： {{ paperScore }}</p>
      <div class="line_wrap">
        <el-form-item label="及格分数" prop="passMark">
          <el-input-number
            size="small"
            :min="0"
            :precision="0"
            :step="1"
            :max="paperScore"
            v-model="dataForm.passMark">
          </el-input-number>
        </el-form-item>
        <el-form-item label="答题次数" prop="answerNum" label-width="100px">
          <el-input-number
            size="small"
            :min="1"
            :max="10"
            :precision="0"
            :step="1"
            v-model="dataForm.answerNum">
          </el-input-number>
        </el-form-item>
        <el-form-item label="考试时间(分)" prop="examTime" label-width="120px">
          <el-input-number
            size="small"
            :min="1"
            :max="180"
            :precision="0"
            :step="1"
            v-model="dataForm.examTime">
          </el-input-number>
        </el-form-item>
      </div>
      <div
        class="select_question_item"
        v-for="item of pageQuestions"
        :key="item.questionTypeId"
      >
        <p class="select_question_item_title">{{ item.questionTypeName }}</p>
        <el-checkbox-group v-model="item.checkedList">
          <el-checkbox
            v-for="(questionNum, index) of item.questionNumList"
            :key="index"
            :label="questionNum"
          >{{ questionNum.score }}分({{ questionNum.num }})</el-checkbox>
        </el-checkbox-group>
        <div class="question_item_wrap">
          <div
            class="question_item"
            v-for="(temp, index) of item.checkedList"
            :key="index"
          >
            <span>{{temp.score}}分题目个数</span>
            <el-input-number
              size="small"
              :min="0"
              :precision="0"
              :step="1"
              :max="parseInt(temp.num)"
              v-model="temp.selectVal"
              @change="questionNumChange">
            </el-input-number>
          </div>
        </div>
      </div>
    </div>
    <div v-else class="no_question">
      <p>暂无题目</p>
    </div>
    <el-form-item label="描述" >
      <el-input type="textarea" v-model="dataForm.description" placeholder="描述"></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import {
  getAllMajor
} from '@/api/exam/major'
import {
    getAllSubject
  } from '@/api/exam/subject'

  import {
    pageQuestionList
  } from '@/api/exam/paper'
  import StartRating from './components/StartRating.vue'
  export default {
    components: {
      StartRating
    },
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          majorId: '',
          paperTitle: '',
          description: '',
          subjectId: '',
          passMark: 0,
          totalPoint: 0,
          difficulty: 0,
          answerNum: 1,
          questionNum: 0,
          examTime: 1,
          examDate: [],
          examDateStart: null,
          examDateEnd: null,
        },
        dataRule: {
          majorId: [
            { required: true, message: '专业不能为空', trigger: 'blur' }
          ],
          subjectId: [
            { required: true, message: '专业不能为空', trigger: 'blur' }
          ],
          paperTitle: [
            { required: true, message: '试卷标题不能为空', trigger: 'blur' }
          ],
          description: [
            { required: true, message: '描述不能为空', trigger: 'blur' }
          ],
          passMark:[
            { required: true, message: '及格分数不能为空', trigger: 'blur' },
          ],
          answerNum: [
            { required: true, message: '答题次数不能为空', trigger: 'blur' },
          ],
          examTime: [
            { required: true, message: '考试时间不能为空', trigger: 'blur' },
          ],
          examDate: [
            { required: true, message: '考试日期不能为空', trigger: 'blur' }
          ],
          difficulty: [
          { required: true, message: '考试难度不能为空', trigger: 'blur' }
          ]
        },
        majotList: [],
        subjectList: [],
        pageQuestions: [],
        splitChar: "∧",
        paperScore: 0
      }
    },
    created() {
      this.getAllMajor()
      this.getAllSubject()
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/exam/paper/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm = data.paper
              }
            })
          }
        })
      },
      getAllMajor() {
        getAllMajor().then(res => {
          if (res.code === 0) {
            this.majotList = res.data
          } else {
            return this.$message.error(res.msg)
          }
        })
      },
      getAllSubject() {
        getAllSubject().then(res => {
          if (res.code == 0) {
            this.subjectList = res.data
          } else {
            return this.$message.error(res.msg)
          }
        })
      },
      paperDialogClose() {
        this.dataForm = {
          majorId: '',
          paperTitle: '',
          description: '',
          subjectId: '',
          passMark: 0,
          totalPoint: 0,
          answerNum: 1,
          examTime: 1,
          difficulty: 0,
        }
        // this.majotList= []
        // this.subjectList= []
        this.pageQuestions= []
        this.paperScore = 0
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            let tempList = []
            this.pageQuestions.forEach(item => {
              if (item.checkedList) {
                item.checkedList.forEach(checkedItem => {
                  if (checkedItem.selectVal != undefined){
                    tempList.push({
                      questionTypeId: checkedItem.questionTypeId,
                      score: checkedItem.score,
                      selectVal: checkedItem.selectVal
                    })
                  }
                })
              }
            })
            let examDate = this.dataForm.examDate
            let param = {
              'id': this.dataForm.id || undefined,
              'majorId': this.dataForm.majorId,
              'subjectId': this.dataForm.subjectId,
              'paperTitle': this.dataForm.paperTitle,
              'description': this.dataForm.description,
              'passMark': this.dataForm.passMark,
              'answerNum': this.dataForm.answerNum,
              'questionNum': this.dataForm.questionNum,
              'examTime': this.dataForm.examTime,
              'totalPoint': this.paperScore,
              'difficulty': this.dataForm.difficulty,
              'examDateStart': examDate[0].getFullYear() + '-' + (examDate[0].getMonth() + 1) + '-' + examDate[0].getDate(),
              'examDateEnd': examDate[1].getFullYear() + '-' + (examDate[1].getMonth() + 1) + '-' + examDate[1].getDate(),
              'seleted': tempList
            }
            console.log(param)
            this.$http({
              url: this.$http.adornUrl(`/exam/paper/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData(param)
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      },
      subjectChangeHandler() {
        this.paperScore = 0
        pageQuestionList(this.dataForm.subjectId).then(res => {
          if (res.code == 0) {
            let pageQuestions = res.data
            pageQuestions.forEach(item => {
              item.checkedList = []
            })
            console.log(pageQuestions)
            this.pageQuestions = pageQuestions
          } else {
            return this.$message.error(res.msg)
          }
        })
      },
      questionNumChange() {
        let paperScore = 0
        let questionNum = 0
        this.pageQuestions.forEach(item => {
          if (item.checkedList.length) {
            item.checkedList.forEach(checkedItem => {
              if (checkedItem.selectVal != undefined){
                paperScore += checkedItem.score * checkedItem.selectVal
                questionNum += checkedItem.selectVal
              }
            })
          }
        })
        this.paperScore = paperScore
        this.dataForm.questionNum = questionNum
      }
    }
  }
</script>
<style lang="scss">
.paper_dialog{
  .start_rating_wrap{
    display: flex;
    align-items: center;
    .el-form-item__content{
      margin-left: 0 !important;
    }
  }
  .line_wrap{
    display: flex;
    align-items: center;
  }
  .select_question_num_wrap{
    border: 1px solid #eee;
    padding: 0 10px;
    margin-bottom: 22px;
    border-radius: 5px;
    .select_question_item{
      border: 1px solid #eee;
      padding: 0 20px 20px 20px;
      border-radius: 5px;
      margin-bottom: 22px;
      .select_question_item_title{

      }
      .el-checkbox-group{

      }
      .question_item_wrap{
        .question_item{
          margin-top: 10px;
          &>span{
            font-size: 13px;
          }
          .el-input-number{
            margin-left: 10px;
          }
        }
      }
    }
  }
  .no_question{
    border: 1px solid #eee;
    padding: 0  20px;
    border-radius: 5px;
    margin-bottom: 22px;
  }
}
</style>
