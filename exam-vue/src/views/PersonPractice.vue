<template>
    <div class="person_praction_container">
        <div class="area_wrap">
            <div class="praction_left">
                <div class="praction_left_title">生成练习试卷</div>
                <div class="mform_item">
                    <p>课程:</p>
                    <el-select v-model="subjectId" placeholder="请选择" @change="subjectSelectHandle">
                        <el-option
                        v-for="item in subjectList"
                        :key="item.id"
                        :label="item.name"
                        :value="item.id">
                        </el-option>
                    </el-select>
                </div>
                <div v-if="questionTypeNumList.length > 0">
                    <div
                        v-for="item of questionTypeNumList"
                        :key="item.questionTypeId"
                        class="mform_item"
                    >
                        <p>{{ item.typeName }}({{ item.num }}):</p>
                        <el-input-number v-model="item.selectNum"  :min="1" :max="item.num" ></el-input-number>
                    </div>
                </div>
                <div class="btn_wrap" v-if="questionTypeNumList.length > 0">
                    <el-button type="primary" size="small" @click="createPaperHandle">生成试卷</el-button>
                </div>
            </div>
            <div class="praction_right" v-if="isShowPaper">
                <div
                    v-for="questionType of questionList"
                    :key="questionType.typeName" 
                    class="question_list_wrap"
                >
                    <div v-if="questionType.record.length > 0" class="question_item_wrap">
                        <div class="type_title">{{ questionType.typeName }}</div>
                        <div
                            v-for="(item, index) of questionType.record" 
                            :key="index"
                            class="question_item"
                        >   
                            <p class="question_title">
                                {{ index+1 }}、
                                <span>{{ item.questionTitle }}</span>
                                <el-button size="mini" @click="showAnswerHandle(item)" type="primary" style="margin-left: 10px">查看答案</el-button>
                            </p>
                            <!-- 单选题 -->
                            <div v-if="questionType.typeId == 1" class="single_choice_wrap choice_wrap">
                                <el-radio-group 
                                    class="choice_item_wrap" 
                                    v-model="item.stuAnswer">
                                    <el-radio 
                                        v-for="(choice, choiceIndex) of item.content.split(splitChar)"
                                        :key="choiceIndex"
                                        :label="choice"
                                        class="choice_item"
                                    >
                                        {{ String.fromCharCode((97 + choiceIndex)+'').toUpperCase() }}.
                                        <span>{{ choice }}</span>
                                    </el-radio>
                                </el-radio-group>
                            </div>
                            <!-- 多选框 -->
                            <div v-else-if="questionType.typeId == 2" class="mult_choice_wrap choice_wrap">
                                <el-checkbox-group class="choice_item_wrap" v-model="item.stuAnswer">
                                    <el-checkbox
                                        v-for="(choice, choiceIndex) of item.content.split(splitChar)"
                                        :key="choiceIndex"
                                        :label="choice"
                                        class="choice_item"
                                    >
                                        {{ String.fromCharCode((97 + choiceIndex)+'').toUpperCase() }}.
                                        <span>{{ choice }}</span>
                                    </el-checkbox>
                                </el-checkbox-group>
                            </div>
                            <!-- 判断题 -->
                            <div v-else-if="questionType.typeId == 4" class="judge_choice_wrap choice_wrap">
                                <el-radio-group class="judge_choice_item_wrap" v-model="item.stuAnswer">
                                    <el-radio :label="'1'" ><i class="el-icon-check"></i></el-radio>
                                    <el-radio :label="'0'" ><i class="el-icon-close"></i></el-radio>
                                </el-radio-group>
                            </div>
                            <!-- 填空题 -->
                            <div v-else-if="questionType.typeId == 3" class="gap_fill_wrap choice_wrap">
                                <div class="gap_fill_item_wrap">
                                    <div
                                        v-for="(choice, choiceIndex) of item.answer.split(splitChar)"
                                        :key="choiceIndex"
                                    >
                                        <p>{{ choiceIndex + 1 }}、</p>
                                        <el-input
                                            v-model="item.stuAnswer[choiceIndex]"
                                        ></el-input>
                                    </div>
                                </div>
                            </div>
                            <!-- 简答题 -->
                            <div v-else class="short_answer_wrap choice_wrap">
                                <el-input
                                    type="textarea"
                                    placeholder="请输入内容"
                                    v-model="item.stuAnswer ">
                                </el-input>
                            </div>

                            <!-- 正确答案 -->
                            <div class="right_answers_wrap" v-if="item.showAnswer">
                                <p>正确答案:</p>
                                <div
                                    v-if="item.questionTypeId == 1 || item.questionTypeId == 2"
                                >
                                    <template
                                        v-for="(choice, index) of item.content.split(splitChar)"
                                    >
                                        <span :key="choice" v-if="item.answer.split(splitChar).findIndex(temp => temp == choice) > -1">
                                            {{ String.fromCharCode((97 + index)+'').toUpperCase() }}
                                        </span>
                                    </template>
                                </div>
                                <div v-else-if="item.questionTypeId == 4">
                                    <span>
                                        <i v-if="item.answer == '1' || item.answer == 1" class="el-icon-check"></i>
                                        <i v-else class="el-icon-close"></i>
                                    </span>
                                </div>
                                <div v-else>
                                    <span v-for="ans of item.answer.split(splitChar)" :key="ans">
                                        {{ ans }}
                                    </span>
                                </div>
                            </div>
                            <!-- 解析 -->
                            <div class="analyse_wrap" v-if="item.showAnswer">
                                <p>解析:</p>
                                <div>{{ item.analyse }}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <el-backtop target=".person_praction_container .praction_right"></el-backtop>
        </div>
    </div>
</template>
<script>
import {
    subjectList
} from '@/api/subject'
import {
    getQuestionNumWithSubjectIdGroupByType,
    getPracticeQuestionList
} from '@/api/questioin'
export default {
    data() {
        return {
            subjectList: [],
            subjectId: null,
            questionTypeNumList: [],
            questionList: [],
            splitChar: "∧",
            isShowPaper: true
        }
    },
    created() {
        this.getSubjectList()
    },
    methods: {
        getSubjectList() {
            subjectList().then(res => {
                if (res.code == 0) {
                    this.subjectList = res.data
                }
            })
        },
        // 改变课程类型
        subjectSelectHandle() {
            getQuestionNumWithSubjectIdGroupByType(this.subjectId).then(res => {
                if (res.code == 0) {
                    this.questionTypeNumList = res.data
                }
            })
        },
        // 点击生成试卷触发
        createPaperHandle() {
            let data = []
            this.questionTypeNumList.forEach(item => {
                if (item.selectNum) {
                    data.push({
                        questionTypeId: item.questionTypeId,
                        selectVal: item.selectNum,
                        typeName: item.typeName
                    })
                }
            })
            if (data.length == 0) {
                return this.$message.warning('请选择试题个数')
            }
            getPracticeQuestionList({
                subjectId: this.subjectId,
                seleted: data
            }).then(res => {
                console.log(res)
                if(res.code == 0) {
                    this.questionList = res.data
                    this.questionList.forEach(item => {
                        item.record.forEach(tem => {
                            item.showAnswer = false
                            if (item.typeId == 2 || item.typeId == 3) {
                                tem.stuAnswer = []
                            }
                        })
                    })
                }
            })
        },
        // 点击查看答案显示
        showAnswerHandle(item) {
            item.showAnswer = true
            this.isShowPaper = false
            this.$nextTick(() => {
                this.isShowPaper = true
            })
        }
    }
}
</script>
<style lang="scss">
.person_praction_container{
    width: 1450px;
    margin: 0 auto;
    padding-top: 30px;
    &>.area_wrap{
        width: 100%;
        display: flex;
        .praction_left{
            width: 30%;
            border: 1px solid #eee;
            padding: 10px;
            .praction_left_title{
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 16px;
                padding: 10px;
            }
            .mform_item{
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                &>p{
                    width: 100px;
                    padding-right: 10px;
                    text-align: end;
                }
            }
            .btn_wrap{
                display: flex;
                align-items: center;
                justify-content: center;
            }
        }
        .praction_right{
            width: 70%;
            padding: 20px;
            .question_list_wrap{
                .question_item_wrap{
                    .type_title{
                        font-size: 16px;
                        background: #dff9fb;
                        padding: 10px;
                        border-radius: 5px;
                        margin-bottom: 20px;
                    }
                    .question_item{
                        margin-bottom: 30px;
                        .question_title{
                            font-size: 15px;
                            padding-bottom: 10px;
                        }
                        .choice_wrap{
                            margin: 0 35px;
                            .choice_item_wrap{
                                display: flex;
                                flex-direction: column;
                                .el-radio__label,
                                .el-checkbox__label{
                                    padding-left: 5px;
                                    span{
                                        padding-left: 5px;
                                    }
                                }
                                .el-checkbox__label{
                                    padding-left: 10px;
                                }
                            }
                            .judge_choice_item_wrap{
                                .el-radio__label i{
                                    font-weight: bold;
                                    font-size: 18px;
                                }
                            }
                            .gap_fill_item_wrap{
                                display: flex;
                                align-items: center;
                                &>div{
                                    width: 25%;
                                    display: flex;
                                    align-items: end;
                                    padding: 0 5px;
                                    .el-input{
                                        .el-input__inner{
                                            border: none;
                                            border-bottom: 1px solid #DCDFE6;
                                        }
                                    }
                                }
                            }
                            .el-textarea{
                                margin-top: 20px;
                            }
                            .choice_item{
                                margin-top: 10px;
                                margin-bottom: 5px;
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
                        .analyse_wrap{
                            color: #636e72;
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
}
</style>