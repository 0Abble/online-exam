<template>
  <el-dialog
    title="试卷信息"
    :close-on-click-modal="false"
    :visible.sync="visible"
    @close="dialogClose"
    width="50%">
    <div class="paper_info_wrap">
      <div
        v-for="(item) of paperInfo.questionList"
        :key="item.id"
        class="question_type_item">
        <p v-if="item.list.length > 0" class="paper_question_title">{{ item.typeName }}</p>
        <div v-if="item.list.length > 0" class="question_item_wrap">
          <div
            v-for="question of item.list"
            :key="question.id"
            class="question_item">
            <p class="question_title">题目：{{ question.questionTitle }}</p>
            <div v-if="item.id == 1 || item.id == 2" class="single_choice_wrap mult_choice_wrap">
              <div
                v-for="(choice, index) of question.content.split(splitChar)"
                :key="choice"
                class="choice_item">
                <p class="choice_tag" :class="{'answer_choice_tag':question.answer.split(splitChar).findIndex(temp => temp == choice) > -1}">{{ String.fromCharCode((97 + index)+'').toUpperCase() }}</p>
                <p class="choice_content">{{ choice }}</p>
              </div>
            </div>
            <div v-else-if="item.id == 3" class="gap_fill_wrap">
              <p v-for="temp of question.answer.split(splitChar)" :key="temp">{{ temp }}</p>
            </div>
            <div v-else-if="item.id == 4" class="judge_choice_wrap">
              <el-radio-group v-model="question.answer">
                <el-radio :label="'1'" disabled><i class="el-icon-check"></i></el-radio>
                <el-radio :label="'0'" disabled><i class="el-icon-close"></i></el-radio>
              </el-radio-group>
            </div>
            <div v-else class="short_answer_wrap">
              <p>{{ question.answer }}</p>
            </div>
            <div class="question_analyse">
              <p>解析</p>
              <div>{{ question.analyse }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary">确定</el-button>
    </span>
  </el-dialog>
</template>
<script>
import {
  paperInfoByPaperId
} from '@/api/exam/paper'
export default {
  data() {
    return {
      visible: true,
      paperInfo: {},
      splitChar: "∧",
    }
  },
  created() {
    // this.init('e41beaf40708c8450abdce5fa2b051ea')
  },
  methods: {
    init(id) {
      this.visible = true
      paperInfoByPaperId(id).then(res => {
        if (res.code == 0) {
          this.paperInfo = res.data
        } else {
          return this.$message.success(res.msg)
        }

      })
    },
    dialogClose() {

    }
  }
}
</script>
<style lang="scss">
.paper_info_wrap{
  p{
    padding: 0;
    margin: 0;
  }
  .question_type_item{
    .paper_question_title{
      font-size: 16px;
      background: #dff9fb;
      padding: 10px;
      border-radius: 5px;
    }
    .question_item_wrap{
      .question_item{
        margin-top: 30px;
        margin-bottom: 30px;
        .question_title{
          font-size: 15px;
        }
        .single_choice_wrap,
        .mult_choice_wrap{
          .choice_item{
            display: flex;
            align-items: center;
            padding: 10px;
            .choice_tag{
              border: 1px solid #909399;
              padding: 0 8px;
              border-radius: 5px;
              display: inline-block;
              font-size: 13px;
            }
            .answer_choice_tag{
              background: #67C23A;
              color: #fff;
            }
            .choice_content{
              font-size: 13px;
              padding-left: 10px;
            }
          }
        }
        .judge_choice_wrap{
          padding: 10px;
          .is-disabled{
            span{
              color: #000;
              font-weight: bold;
              font-size: 18px;
            }
          }
          .is-checked{
            span{
              color: #67C23A;
            }
            .el-radio__inner::after{
              background: #67C23A;
            }
          }
        }
        .gap_fill_wrap{
          padding: 10px;
          p{
            display: inline-block;
            border-bottom: 1px solid #ccc;
            padding: 0 5px;
            margin: 0 10px;
          }
        }
        .short_answer_wrap{
          padding: 10px;
          p{
            padding: 0 10px;
            border-bottom: 1px solid #ccc;
          }
        }
        .question_analyse{
          p{
            font-size: 15px;
          }
          div{
            background: #eee;
            padding: 10px;
            border-radius: 5px;
            margin-top: 5px;
            font-size: 13px;
          }
        }
      }
    }

  }
}
</style>
