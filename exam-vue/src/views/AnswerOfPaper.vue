<template>
    <div class="paper_info_container">
        <div class="question_wrap">
            <el-scrollbar style="height: 100%">
                <el-card shadow="never">
                    <div class="exam_title">{{ paperInfo.paperTitle }}</div>
                    <div
                        v-for="questionType of paperInfo.questionList"
                        :key="questionType.id" 
                        class="question_list_wrap"
                    >
                        <div v-if="questionType.list.length > 0" class="question_item_wrap">
                            <div class="type_title">{{ questionType.typeName }}</div>
                            <div
                                v-for="(item, index) of questionType.list" 
                                :key="item.id"
                                class="question_item"
                            >   
                                <p class="question_title" :id="'ques_'+questionType.id+'_'+item.id">
                                    {{ index+1 }}、
                                    <span>{{ item.questionTitle }}</span>
                                    <span>({{ item.score }}分)</span>
                                </p>
                                <!-- 单选题 -->
                                <div v-if="questionType.id == 1" class="single_choice_wrap choice_wrap">
                                    <el-radio-group 
                                        @change="singleChoiceChange(item, index)"
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
                                <div v-else-if="questionType.id == 2" class="mult_choice_wrap choice_wrap">
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
                                <div v-else-if="questionType.id == 4" class="judge_choice_wrap choice_wrap">
                                    <el-radio-group class="judge_choice_item_wrap" v-model="item.stuAnswer">
                                        <el-radio :label="'1'" ><i class="el-icon-check"></i></el-radio>
                                        <el-radio :label="'0'" ><i class="el-icon-close"></i></el-radio>
                                    </el-radio-group>
                                </div>
                                <!-- 填空题 -->
                                <div v-else-if="questionType.id == 3" class="gap_fill_wrap choice_wrap">
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
                            </div>
                        </div>
                    </div>
                </el-card>
            </el-scrollbar>
        </div>
        <div class="marker_wrap">
            <div class="paper_info_wrap">
                <div class="exam_time_wrap info_wrap">剩余考试时间(分): <span>{{ countDownTime }}</span></div>
                <div class="exam_stu_wrap info_wrap">考生: <span>{{ user.stuNo }}</span></div>
            </div>
            <div class="question_marker_wrap">
                <div
                    v-for="questionType of paperInfo.questionList"
                    :key="questionType.id" 
                    class="question_item_wrap"
                >
                    <div v-if="questionType.list.length > 0" class="marker_question_wrap" >
                        <p class="question_type_title">{{ questionType.typeName }}</p>
                        <div class="marker_item_wrap">
                            <p
                                v-for="(marker, index) of questionType.list"
                                :key="marker.id"
                                :class="{'answered': marker.stuAnswer instanceof Array ? marker.stuAnswer.length > 0 : marker.stuAnswer}"
                            >
                                <a :href="'#ques_'+questionType.id+'_'+marker.id">{{ index+1 }}</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn_wrap">
                <el-button type="primary" plain size="small" @click="submitPaper">交卷</el-button>
            </div>
        </div>
    </div>
</template>
<script>
import {
    getPaperInfoByPaperId,
    getPaperByPaperId
} from '@/api/paper'
import {
  getUserInfo
} from '@/api/user'
import {
    submitPaperInfo
} from '@/api/paperRecord'
export default {
    data() {
        return {
            // e41beaf40708c8450abdce5fa2b051ea
            paperId: '',
            paperInfo: {},
            splitChar: "∧",
            countDownTime: '',
            user: {},
            quitCount: 0,
            timer: null,
            isSubmit: false,
        }
    },
    created() {
        this.paperId = this.$route.params.paperId
        this.init()
    },  
    mounted() {
        // 页面禁止后退
        if (window.history && window.history.pushState) {
            // 向历史记录中插入了当前页
            history.pushState(null, null, document.URL);
            window.addEventListener('popstate', this.goBack, false);
        }

        // 监听页面的切换 隐藏 退出
        document.addEventListener('visibilitychange', this.handleVisiable)

        // 关闭网页
        window.addEventListener("beforeunload", (e) => this.beforeunloadHandler(e))
        window.addEventListener("unload", (e) => this.unloadHandler(e));
        
        this.$notify({
          title: '提示',
          message: '关闭页面或者退出三次视为交卷',
          duration: 0
        });
    },
    destroyed() {
        // 注销监听
        window.removeEventListener('popstate', this.goBack, false);
        document.removeEventListener('visibilitychange', this.handleVisiable) 
        window.removeEventListener("beforeunload", (e) => this.beforeunloadHandler(e))
        window.removeEventListener("unload", (e) => this.unloadHandler(e));
    },  
    methods: {
        init() {
            getPaperByPaperId(this.paperId).then(res => {
                if (res.code == 0) {
                    let paper = res.data
                    if (paper.answerNum <= 0) {
                        this.$alert('答题次数以用完', '提示', {
                            confirmButtonText: '确定',
                            callback: action => {
                                this.$router.push('/mine')
                            }
                        });
                    } else if (this.isObsolete(paper.examDateEnd)) {
                        this.$alert('试卷已过考试时间', '提示', {
                            confirmButtonText: '确定',
                            callback: action => {
                                this.$router.push('/mine')
                            }
                        });
                    } else {
                        this.getPaperInfoByPaperId()
                        this.getUserInfo()
                    }
                } else {
                    return this.$message.error(res.msg)
                }
            })
        },
        isObsolete(endDate) {
            let dateTimeList = endDate.split('-')
            let date = new Date()
            if (parseInt(dateTimeList[0]) < date.getFullYear()) {
                return true
            }
            if (parseInt(dateTimeList[1]) < (date.getMonth() + 1)) {
                return true
            }
            if (parseInt(dateTimeList[2]) < date.getDate()) {
                return true
            }
            return false
        },
        goBack () {
            // console.log("点击了浏览器的返回按钮");
            history.pushState(null, null, document.URL);
        },
        handleVisiable(e) {  
            switch(e.target.visibilityState) {
            case 'prerender':
                console.log('网页预渲染，内容不可见')
                break;
            case 'hidden':
                console.log('内容不可见，处理后台、最小化、锁屏状态')
                // alert('警告！你已经离开当前答题页面');
                this.quitCount++
                break;
            case 'visible':
                console.log('处于正常打开')
                if (this.quitCount >= 3 && !this.isSubmit) {
                    this.submitPaper()
                }
                break;
            }
        },
        // 页面关闭之前，触发提示框
        beforeunloadHandler(e) {
            if (e) {
                e = e || window.event;
                console.log(e);
                if (e) {
                    e.returnValue = "关闭提示";
                }
                return "关闭提示";
            }
        },
        // 页面关闭
        unloadHandler(e) {
            // 提交试卷
            if (!this.isSubmit) {

                this.submitPaper()
            }
        },
        getUserInfo() {
            getUserInfo().then(res => {
                if (res.code == 0) {
                    this.user = res.data
                }
            })
        },
        // 得到试卷信息
        getPaperInfoByPaperId(){
            getPaperInfoByPaperId({paperId: this.paperId}).then(res => {
                if (res.code == 0) {
                    this.paperInfo = res.data
                    this.paperInfo.questionList.forEach(item => {
                        item.list.forEach(question => {
                            if (item.id == 2 || item.id == 3) {
                                question.stuAnswer = []
                            } else {
                                question.stuAnswer = ''
                            }
                        })
                    })
                    this.countDownHandle(this.paperInfo.examTime)
                } else {
                    return this.$message.error(res.msg)
                }
            })
        },
        // 倒计时
        countDownHandle(examTime) {
            let suMsecond = parseInt(examTime) * 60

            let tempExamTime = window.localStorage.getItem('suMsecond') | null
            if (tempExamTime) {
                suMsecond = tempExamTime
            } else {
                window.localStorage.setItem('suMsecond', suMsecond)
            }

            let hour = parseInt(suMsecond / 3600)
            let minute = parseInt((suMsecond - (hour * 3600)) / 60)
            let second = parseInt(suMsecond - (hour * 3600) - (minute * 60))
            this.countDownTime = ((hour < 10 ? '0'+hour:hour) + '时' + (minute < 10 ? '0'+minute:minute) + '分' + (second < 10 ? '0'+second:second)+'秒')
            this.timer = setInterval(()=>{
                suMsecond -= 1;
                window.localStorage.setItem('suMsecond', suMsecond)
                let hour = parseInt(suMsecond / 3600)
                let minute = parseInt((suMsecond - (hour * 3600)) / 60)
                let second = parseInt(suMsecond - (hour * 3600) - (minute * 60))
                this.countDownTime = ((hour < 10 ? '0'+hour:hour) + '时' + (minute < 10 ? '0'+minute:minute) + '分' + (second < 10 ? '0'+second:second)+'秒')
                if (hour == 0 && minute == 10) {
                    this.$notify({
                        title: '警告',
                        message: '考试时间还剩下10分钟',
                        type: 'warning'
                    });
                }
                if (hour == 0 &&  minute == 0 && suMsecond <= 0) {
                    clearInterval(timer)
                    if (!this.isSubmit) {
                        this.submitPaper()
                    }
                }
            }, 1000)
        },
        singleChoiceChange(item, index) {
            let temp = JSON.parse(JSON.stringify(this.paperInfo))
            this.paperInfo = {}
            this.paperInfo = temp
        },
        //提交试卷
        submitPaper() {
            console.log('submit')
            this.isSubmit = true
            if (this.timer) {
                clearInterval(this.timer)
            }
            window.localStorage.removeItem('suMsecond')
            let questionRecordList = []
            this.paperInfo.questionList.forEach(item => {
                item.list.forEach(question => {
                    let params = {
                        questionId: question.id,
                    }
                    if (item.id == 2 || item.id == 3) {
                        params.stuAnswer = question.stuAnswer.length > 0 ? question.stuAnswer.join(this.splitChar) : ''
                    } else {
                        params.stuAnswer = question.stuAnswer
                    }
                    questionRecordList.push(params)
                })
            })
            let params = {
                paperId: this.paperInfo.id,
                stuNo: this.user.stuNo,
                questionRecordList,
            }
            console.log(params)
            submitPaperInfo(params).then(res => {
            })
            this.$alert('考试结束', '提示', {
                confirmButtonText: '返回上一级',
                callback: action => {
                    this.$router.push('/mine')
                }
            });
        },
        back(){
            if (window.history.length <= 1) {
                this.$router.push({path:'/'})
                return false
            } else {
                this.$router.go(-1)
            }
        }
    }
}
</script>
<style lang="scss">
.paper_info_container{
    display: flex;
    justify-content: center;
    padding-top: 30px;
    background-image: url('../assets/img/concrete-texture.png');
    .question_wrap{
        width: 1100px;
        height: calc(100vh - 30px);
        .exam_title{
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-family: Arial, Helvetica, sans-serif;
            margin-bottom: 30px;
        }
        .el-scrollbar__wrap{
            overflow-x: hidden;
            scroll-behavior: smooth;
        }
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
            }
        }
    }
    .marker_wrap{
        margin-left: 20px;
        width: 270px;       
        border: 1px solid #eee;
        .paper_info_wrap{
            background: #ffffff;
            padding: 10px;
            border-bottom: 1px solid #eee;
            .info_wrap{
                display: flex;
                align-items: center;
                span{
                    font-size: 13px;
                    color: #636e72;
                    padding-left: 10px;
                }
            }
            .exam_stu_wrap{
                margin-top: 5px;
            }
        }
        .question_marker_wrap{
            background: #ffffff;
            padding: 10px;
            border-bottom: 1px solid #eee;
            .question_item_wrap{
                .marker_question_wrap{
                    .question_type_title{
    
                    }
                    .marker_item_wrap{
                        display: flex;
                        flex-wrap: wrap;
                        width: 250px;
                        &>p{
                            width: 40px;
                            height: 40px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            a{
                                margin: 5px;
                                border: 1px solid #ccc;
                                text-decoration: none;
                                font-style: normal;
                                color: #636e72;
                                font-size: 13px;
                                height: 30px;
                                width: 30px;
                                display: flex;
                                align-items: center;
                                justify-content: center;
                                border-radius: 5px;
                            }
                        }
                        .answered{
                            a{
                                background-color: #f0f9eb;
                                border-color: #e1f3d8;
                                color: #67c23a;
                            }
                        }
                    }
                }
            }
        }
        .btn_wrap{
            background: #ffffff;
            padding: 10px;  
            display: flex;
            align-items: center;
            justify-content: center;
            .el-button{
                // padding: 9px 20px;
                width: 125px;
            }
        }
    }
}
</style>