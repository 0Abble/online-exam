<template>
    <el-dialog
        title="试卷信息"
        :close-on-click-modal="false"
        :visible.sync="visible"
        :footer="false"
        @close="visible = false"
        class="exam_record_question_container">
        <div class="paper_info_wrap">
      <div
        v-for="(item, index) of questionList"
        :key="item.typeId"
        class="question_type_item">
        <p v-if="item.record.length > 0" class="paper_question_title">{{ item.typeName }}</p>
        <div v-if="item.record.length > 0" class="question_item_wrap">
          <div
            v-for="question of item.record"
            :key="question.id"
            class="question_item">
            <p class="question_title">题目：{{ question.questionTitle }}</p>
            <div v-if="item.typeId == 1 || item.typeId == 2" class="single_choice_wrap mult_choice_wrap">
              <div
                v-for="(choice, index) of question.content.split(splitChar)"
                :key="choice"
                class="choice_item">
                <p class="choice_tag" 
                    :class="{'answer_choice_tag':question.stuAnswer.split(splitChar).findIndex(temp => temp == choice) > -1}">
                    {{ String.fromCharCode((97 + index)+'').toUpperCase() }}
                </p>
                <p class="choice_content">
                    {{ choice }}
                </p>    
              </div>
            </div>
            <div v-else-if="item.typeId == 3" class="gap_fill_wrap">
              <p v-for="temp of question.stuAnswer.split(splitChar)" :key="temp">{{ temp }}</p>
            </div>
            <div v-else-if="item.typeId == 4" class="judge_choice_wrap">
              <el-radio-group v-model="question.stuAnswer">
                <el-radio :label="'1'" disabled><i class="el-icon-check"></i></el-radio>
                <el-radio :label="'0'" disabled><i class="el-icon-close"></i></el-radio>
              </el-radio-group>
            </div>
            <div v-else class="short_answer_wrap">
              <p>{{ question.stuAnswer }}</p>
            </div>
            <div class="right_answers_wrap">
                <p>正确答案:</p>
                <div
                    v-if="item.typeId == 1 || item.typeId == 2"
                >
                    <template
                        v-for="(choice, index) of question.content.split(splitChar)"
                    >
                        <span :key="choice" v-if="question.answer.split(splitChar).findIndex(temp => temp == choice) > -1">
                            {{ String.fromCharCode((97 + index)+'').toUpperCase() }}
                        </span>
                    </template>
                </div>
                <div v-else-if="item.typeId == 4">
                    <span>
                        <i v-if="question.answer == '1' || question.answer == 1" class="el-icon-check"></i>
                        <i v-else class="el-icon-close"></i>
                    </span>
                </div>
                <div v-else>
                    <span v-for="ans of question.answer.split(splitChar)" :key="ans">
                        {{ ans }}
                    </span>
                </div>
            </div>
            <div class="question_analyse">
              <p>解析</p>
              <div>{{ question.analyse }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </el-dialog>
</template>
<script>
import {
    questionRecordListByQuesRecId
} from '@/api/paperRecord'
export default {
    data() {
        return {
            visible: false,
            questionList: [],
            splitChar: "∧",
        }
    },
    methods: {
        init(paperRecordId) {
            this.visible = true
            questionRecordListByQuesRecId(paperRecordId).then(res => {
                console.log(res)
                if (res.code == 0) {
                    this.questionList = res.data
                }
            })
        }
    }
}
</script>
<style lang="scss">
.exam_record_question_container{
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
                padding-bottom: 10px;
                border-bottom: 1px solid #ccc;
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
                    .non_answer_choice_tag{
                        color: red;
                    }
                    .choice_content{
                        font-size: 13px;
                        padding-left: 10px;
                    }
                }
                }
                .right_answers_wrap{
                    display: flex;
                    align-items: center;
                    padding: 5px;
                    border-radius: 5px;
                    color: #67c23a;
                    span{
                        padding-left: 5px;
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
}
</style>