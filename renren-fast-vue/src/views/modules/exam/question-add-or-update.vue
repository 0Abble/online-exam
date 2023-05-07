<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible"
    width="60%"
    class="question_dialog"
    @close="questionDialogClose"
    >
    <el-form
      :model="dataForm"
      :rules="dataRule"
      ref="dataForm"
      @keyup.enter.native="dataFormSubmit()"
      label-width="80px"
    >
      <div class="line_wrap">
        <el-form-item label="题目类型" prop="questionTypeId">
          <el-select v-model="dataForm.questionTypeId" placeholder="请选择" :disabled="dataForm.id != null && dataForm.id != undefined && dataForm.id != ''">
            <el-option
              v-for="item in questTypeList"
              :key="item.id"
              :label="item.typeName"
              :value="item.id+''">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="课程科目" prop="subjectId">
          <el-select v-model="dataForm.subjectId" placeholder="请选择" :disabled="dataForm.id != null && dataForm.id != undefined && dataForm.id != ''">
            <el-option
              v-for="item in subjectList"
              :key="item.id"
              :label="item.name"
              :value="item.id+''">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="题目分数" prop="score">
          <el-input type="number" v-model="dataForm.score" placeholder="题目分数"></el-input>
        </el-form-item>
      </div>
      <el-form-item label="问题题目" prop="questionTitle">
        <el-input type="textarea" v-model="dataForm.questionTitle" placeholder="问题题目"></el-input>
      </el-form-item>
      <el-form-item label="题目难度" class="start_rating_wrap">
        <StartRating v-model="dataForm.difficulty"/>
      </el-form-item>
      <!-- 单选题 -->
      <div v-if="dataForm.questionTypeId == '1'" class="single_choice_wrap choice_wrap">
        <div class="operate_btn_wrap">
          <p>
            <span>添加选项</span>
            <i @click="addSingleChoice" class="el-icon-plus"></i>
          </p>
        </div>
        <div
          class="single_choice_item"
          v-for="(item, index) of singleChoiceList"
          :key="index">
          <el-radio v-model="dataForm.answer" :label="item.value">
            <p class="choice_tag">{{ String.fromCharCode((97 + index)+'').toUpperCase() }}</p>
          </el-radio>
          <el-form-item
            label-width="0"
          >
            <el-input
              placeholder="请输入内容"
              v-model="item.value"
            >
            </el-input>
          </el-form-item>
          <i @click="subSingleChoice(item)" class="el-icon-minus"></i>
        </div>
      </div>
      <!-- 多选题 -->
      <div v-else-if="dataForm.questionTypeId == '2'" class="mult_choice_wrap choice_wrap">
        <div class="operate_btn_wrap">
          <p>
            <span>添加选项</span>
            <i @click="addMultChoice" class="el-icon-plus"></i>
          </p>
        </div>
        <div class="mult_choice_item"
          v-for="(item, index) of multChoiceList"
          :key="index"
        >
          <el-checkbox  v-model="item.isCheck">
            <p class="choice_tag">{{ String.fromCharCode((97 + index)+'').toUpperCase() }}</p>
          </el-checkbox>
          <el-form-item
            label-width="0"
          >
            <el-input
              placeholder="请输入内容"
              v-model="item.value"
            >
            </el-input>
          </el-form-item>
          <i @click="subMultChoice(item)" class="el-icon-minus"></i>
        </div>
      </div>
      <!-- 填空题 -->
      <div v-else-if="dataForm.questionTypeId == '3'"  class="gap_fill_wrap choice_wrap">
        <p class="answer_title"><span>填空题答案</span></p>
        <el-tag
          v-for="tag in dynamicTags"
          :key="tag"
          closable
          :disable-transitions="false"
          @close="handleClose(tag)"
          type="info"
          >
          {{tag}}
        </el-tag>
        <el-input
          class="input-new-tag"
          v-if="inputVisible"
          v-model="inputValue"
          ref="saveTagInput"
          size="small"
          type="textarea"
          @keyup.enter.native="handleInputConfirm"
          @blur="handleInputConfirm"
        >
        </el-input>
        <el-button v-else class="button-new-tag" size="small" @click="showInput">+ 答案</el-button>
      </div>
      <!-- 判断题 -->
      <div v-else-if="dataForm.questionTypeId == '4'" class="judge_choice_wrap choice_wrap">
        <p class="answer_title"><span>判断题答案</span></p>
        <el-radio-group v-model="dataForm.answer">
          <el-radio :label="'1'"><i class="el-icon-check"></i></el-radio>
          <el-radio :label="'0'"><i class="el-icon-close"></i></el-radio>
        </el-radio-group>
      </div>
      <!-- 简答题 -->
      <div v-else class="short_answer_wrap choice_wrap">
        <p class="answer_title"><span>简答题答案</span></p>
        <el-input type="textarea" maxlength="500" show-word-limit v-model="dataForm.answer" placeholder="请输入"></el-input>
      </div>

      <el-form-item label="题目分析">
        <el-input type="textarea" v-model="dataForm.analyse" placeholder="题目分析"></el-input>
      </el-form-item>
      <el-form-item label="描述">
        <el-input type="textarea"  v-model="dataForm.description" placeholder="描述"></el-input>
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
  getAllSubject
} from '@/api/exam/subject'

import {
  getAllQuestType
} from '@/api/exam/questType'
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
          questionTypeId: '1',
          subjectId: '',
          questionTitle: '',
          content: '',
          answer: '',
          analyse: '',
          score: '',
          description: '',
          difficulty: 0,
        },
        dataRule: {
          questionTypeId: [
            { required: true, message: '题目类型id不能为空', trigger: 'blur' }
          ],
          subjectId: [
            { required: true, message: '课程科目不能为空', trigger: 'blur' }
          ],
          questionTitle: [
            { required: true, message: '问题题目不能为空', trigger: 'blur' },
             { min: 0, max: 500, message: '长度在 3 到 500 个字符', trigger: 'blur' }
          ],
          content: [
            { required: true, message: '题目内容不能为空', trigger: 'blur' }
          ],
          answer: [
            { required: true, message: '答案不能为空', trigger: 'blur' }
          ],
          analyse: [
            { required: true, message: '题目分析不能为空', trigger: 'blur' },
            { min: 0, max: 500, message: '长度在 3 到 500 个字符', trigger: 'blur' }
          ],
          score: [
            { required: true, message: '题目分数不能为空', trigger: 'blur' }
          ],
          description: [
            // { required: true, message: '描述不能为空', trigger: 'blur' },
            { min: 0, max: 500, message: '长度在 3 到 500 个字符', trigger: 'blur' }
          ]
        },
        subjectList: [],
        questTypeList: [],
        // 单选
        singleChoiceList: [],
        // 多选
        multChoiceList: [],
        // 填空题
        dynamicTags: [],
        inputVisible: false,
        inputValue: '',
        splitChar: "∧"
      }
    },
    created() {
      this.getAllSubject()
      this.getAllQuestType()
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/exam/question/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm = data.question
                // this.dataForm.questionTypeId = data.question.questionTypeId
                // this.dataForm.subjectId = data.question.subjectId
                // this.dataForm.questionTitle = data.question.questionTitle
                // this.dataForm.content = data.question.content
                // this.dataForm.answer = data.question.answer
                // this.dataForm.analyse = data.question.analyse
                // this.dataForm.score = data.question.score
                // this.dataForm.description = data.question.description
                if (data.question.questionTypeId == 1) {
                  data.question.content.split(this.splitChar).forEach(item => {
                    this.singleChoiceList.push({
                      value: item
                    })
                  })
                }
                if (data.question.questionTypeId == 2) {
                  data.question.content.split(this.splitChar).forEach(item => {
                    let answerList = data.question.answer.split(this.splitChar)
                    let isCheck = false
                    if (answerList.indexOf(item) > -1) isCheck = true
                    this.multChoiceList.push({
                      isCheck,
                      value: item
                    })
                  })
                }
                if (data.question.questionTypeId == 3) {
                  this.dynamicTags = data.question.answer.split(this.splitChar)
                }
                if (data.question.questionTypeId == 4) {

                }
              }
            })
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
      getAllQuestType() {
        getAllQuestType().then(res => {
          if (res.code == 0) {
            this.questTypeList = res.data
          } else {
            return this.$message.error(res.msg)
          }
        })
      },
      // dialog关闭时触发
      questionDialogClose() {
        this.dataForm = {
          id: 0,
          questionTypeId: '1',
          subjectId: '',
          questionTitle: '',
          content: '',
          answer: '',
          analyse: '',
          score: '',
          description: '',
          difficulty: 0
        }
        this.singleChoiceList = []
        this.multChoiceList = []
        this.dynamicTags = []
        this.inputVisible = false
        this.inputValue = ''
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          let splitChar = this.splitChar
          if (valid) {
            if (this.dataForm.questionTypeId == '1') {
              let singleValList = this.singleChoiceList.map(item => item.value)
              this.dataForm.content = singleValList.join(splitChar)
            } else if (this.dataForm.questionTypeId == '2') {
              let multValList = this.multChoiceList.map(item => item.value)
              this.dataForm.content = multValList.join(splitChar)
              let answerList = []
              this.multChoiceList.forEach(item => {
                if (item.isCheck) {
                  answerList.push(item.value)
                }
              })
              this.dataForm.answer = answerList.join(splitChar)
            } else if (this.dataForm.questionTypeId == '3') {
              this.dataForm.content = ""
              this.dataForm.answer = this.dynamicTags.join(splitChar)
            } else {
              this.dataForm.content = ""
            }

            let param = {
              'id': this.dataForm.id || undefined,
              'questionTypeId': this.dataForm.questionTypeId,
              'subjectId': this.dataForm.subjectId,
              'questionTitle': this.dataForm.questionTitle,
              'content': this.dataForm.content,
              'answer': this.dataForm.answer,
              'analyse': this.dataForm.analyse,
              'score': this.dataForm.score,
              'description': this.dataForm.description,
              'difficulty': this.dataForm.difficulty
            }
            if (!this.dataForm.answer) {
              return this.$message.error('答案是必填选')
            }
            this.$http({
              url: this.$http.adornUrl(`/exam/question/${!this.dataForm.id ? 'save' : 'update'}`),
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
      // 添加单选
      addSingleChoice() {
        this.singleChoiceList.push({
          value: ''
        })
      },
      // 删除单选
      subSingleChoice(item) {
        this.singleChoiceList.splice(this.singleChoiceList.indexOf(item), 1)
      },

      /// 添加多选
      addMultChoice() {
        this.multChoiceList.push({
          isCheck: false,
          value: ''
        })
      },
      // 删除多选选项
      subMultChoice(item) {
        this.multChoiceList.splice(this.multChoiceList.indexOf(item), 1)
      },

      // 填空题
      handleClose(tag) {
        this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
      },
      showInput() {
        this.inputVisible = true;
        this.$nextTick(_ => {
          this.$refs.saveTagInput.$refs.textarea.focus();
        });
      },
      handleInputConfirm() {
        let inputValue = this.inputValue;
        if (inputValue) {
          this.dynamicTags.push(inputValue);
        }
        this.inputVisible = false;
        this.inputValue = '';
      }
    }
  }
</script>
<style lang="scss">
.question_dialog{
  .start_rating_wrap{
    display: flex;
    align-items: center;
    .el-form-item__content{
      margin-left: 0 !important;
    }
  }
  .line_wrap{
    display: flex;
    .el-form-item{
      margin-right: 20px;
    }
  }
  .operate_btn_wrap{
    margin-bottom: 22px;

    i{
      border-radius: 5px;
      margin-left: 5px;
      background: #409EFF;
      color: #fff;
      padding: 10px;
    }
  }
  .choice_wrap{
    border: 1px solid #eee;
    border-radius: 5px;
    padding: 5px 20px 0 20px;
    margin-bottom: 22px;
  }
  .single_choice_wrap ,
  .mult_choice_wrap{
    .single_choice_item,
    .mult_choice_item{
      display: flex;
      align-items: center;
      margin-bottom: 22px;
      width: 100%;
      transition: all .2s;
      .el-radio,
      .el-checkbox {
        display: flex;
        align-items: center;
        .el-radio__inner,
        .el-checkbox__inner{
          height: 18px;
          width: 18px;
        }
        .choice_tag{
            margin: 0;
            color: #17B3A3;
            background: rgb(232, 247, 246);
            border-color: rgb(162, 225, 218);
            border-radius: 5px;
            padding: 10px 14px;
            line-height: normal;
        }
      }
      .el-form-item{
        width: 80%;
        margin-bottom: 0;
        padding-left: 10px;
      }
      .el-icon-minus{
        background: #F56C6C;
        border-radius: 5px;
        padding: 10px;
        margin-left: 10px;
        color: #fff;
        font-weight: bold;
      }
    }
  }

  .gap_fill_wrap{
    padding-bottom: 22px;
    .el-tag + .el-tag {
      margin-left: 10px;
    }
    .button-new-tag {
      margin-left: 10px;
      height: 32px;
      line-height: 30px;
      padding-top: 0;
      padding-bottom: 0;
    }
    .input-new-tag {
      margin-top: 10px;
    }
  }
  .judge_choice_wrap{
    padding-bottom: 22px;
  }
  .short_answer_wrap{
    padding-bottom: 22px;
  }
  .answer_title{
    &>span{
      background: #909399;
      color: #fff;
      padding: 10px;
      border-radius: 5px;
    }
  }
}
</style>
