<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <div class="correcting_wrap">
      <p>单选题、多选题、判断题 由系统判断，正确数:
        <span>{{ paperRecordForm.correctNum }}</span>
        已得分:
        <span>{{ paperRecordForm.examScore }}</span>
      </p>
      <div
        v-for="item of questionList"
        :key="item.typeId"
        class="type_wrap">
        <div v-if="(item.typeId == 3 || item.typeId == 5) && item.record.length > 0">
          <p>{{ item.typeName }}</p>
          <div
            v-for="ques of item.record"
            :key="ques.id"
            class="question_wrap">
            <p class="question_title">{{ ques.questionTitle }}({{ ques.score }}分)</p>
            <p class="stu_answer">
              学生答案:
              <span v-for="stuA of ques.stuAnswer.split(splitChar)" :key="stuA">{{ stuA }}</span></p>
            <p class="answer">
              正确答案:
              <span v-for="ans of ques.answer.split(splitChar)" :key="ans">{{ ans }}</span>
            </p>
            <div class="line_wrap">
              <el-radio-group v-model="ques.isRight" @change="rightChangehandle(ques)">
                <el-radio :label="1">正确</el-radio>
                <el-radio :label="0">错误</el-radio>
              </el-radio-group>
              <div>
                <span>得分:</span>
                <el-input-number v-model="ques.quesScore" @change="rightChangehandle(ques)" :min="0" :max="ques.score" label="得分"></el-input-number>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import {
  getQuestionRecord,
  savePaperQuestionRecoed
} from '@/api/exam/paper'
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          paperId: '',
          stuNo: '',
          isChecked: '',
          description: '',
          isDeleted: '',
          createBy: '',
          updateBy: '',
          createTime: '',
          updateTime: ''
        },
        dataRule: {
          paperId: [
            { required: true, message: '试卷id不能为空', trigger: 'blur' }
          ],
          stuNo: [
            { required: true, message: '学生学号不能为空', trigger: 'blur' }
          ],
          isChecked: [
            { required: true, message: '0: 改卷中 -1: 未及格 1 及格不能为空', trigger: 'blur' }
          ],
          description: [
            { required: true, message: '描述不能为空', trigger: 'blur' }
          ],
          isDeleted: [
            { required: true, message: '逻辑删除0未删除1以删除不能为空', trigger: 'blur' }
          ],
          createBy: [
            { required: true, message: '创建人不能为空', trigger: 'blur' }
          ],
          updateBy: [
            { required: true, message: '修改人不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '修改时间不能为空', trigger: 'blur' }
          ]
        },
        splitChar: "∧",
        questionList:[],
        paperRecordForm: {
          id: '',
          correctNum: 0,
          examScore: 0
        },
        questionRecords: [],
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        let questionRecords = []
        this.paperRecordForm.id = id
        getQuestionRecord(id).then(res => {
          let rescord = res.data
          this.questionList = res.data
          rescord.forEach(item => {
            // 单选题 | 多选题
            if (item.typeId == 1 || item.typeId == 2) {
              item.record.forEach(ques => {
                let answers = ques.answer.split(this.splitChar)
                let stuAnswers = ques.stuAnswer.split(this.splitChar)
                let isRight = 1
                stuAnswers.forEach(stuAnswer => {
                  if (answers.indexOf(stuAnswer) < 0) {
                    isRight = 0
                    return
                  }
                })
                questionRecords.push({
                  id: ques.questionRecordId,
                  isRight,
                  score: isRight == 1 ? ques.score : 0
                })
              })
            } else if (item.typeId == 4) { // 判断题
              item.record.forEach(ques => {
                let isRight = 0
                if (ques.answer == ques.stuAnswer) {
                  isRight = 1
                }
                questionRecords.push({
                  id: ques.questionRecordId,
                  isRight,
                  score: isRight == 1 ? ques.score : 0
                })
              })
            }

          })
          this.questionRecords = questionRecords
          this.disposePaperRecord()
        })
      },
      // 处理 paperRecord
      disposePaperRecord() {
        let correctNum = 0
        let examScore = 0
        this.questionRecords.forEach(item => {
          if (item.isRight == 1) {
            correctNum++
          }
          examScore = examScore + item.score
        })
        this.paperRecordForm.correctNum = correctNum
        this.paperRecordForm.examScore = examScore
      },
      // 表单提交
      dataFormSubmit () {
        let data = {
          ...this.paperRecordForm,
          'questionRecordList': this. questionRecords
        }
        // console.log(data)
        savePaperQuestionRecoed(data).then(res => {
          if (res.code == 0) {
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
            return this.$message.error(res.msg)
          }
        })
      },
      //
      rightChangehandle(val) {
        let index = -1
        for(let i = 0;i<this.questionRecords.length;i++) {
          if (this.questionRecords[i].id == val.questionRecordId) {
            index = i
            break
          }
        }
        if (index < 0) {
          this.questionRecords.push({
            id: val.questionRecordId,
            isRight: val.isRight,
            score: val.quesScore ? val.quesScore : 0
          })
        }else{
          this.questionRecords[index] ={
            id: val.questionRecordId,
            isRight: val.isRight,
            score: val.quesScore ? val.quesScore : 0
          }
        }
        this.disposePaperRecord()
      }
    }
  }
</script>
<style lang="scss">
.correcting_wrap{
  .type_wrap{
    &>div>p{
      font-size: 16px;
      background: #dff9fb;
      padding: 10px;
      border-radius: 5px;
    }
    .question_wrap{
      border-bottom: 1px solid #eee;
      padding-bottom: 10px;
      .question_title{

      }
      .stu_answer{
        font-size: 12px;
        &>span{
          border-bottom: 1px solid #ccc;
          margin-left: 10px;
          padding: 0 5px;
        }
      }
      .answer{
        font-size: 12px;
        &>span{
          border-bottom: 1px solid #ccc;
          margin-left: 10px;
          padding: 0 5px;
        }
      }
      .line_wrap{
        display: flex;
        align-items: center;
        .el-radio-group{
          margin-right: 20px;
        }
        &>div>span{
          margin-right: 5px;
        }
      }
    }
  }
}
</style>
