<template>
    <div class="exam_record">
        <el-card shadow="never">
            <div class="search_wrap">
                <div class="input_wrap">
                <p>名称：</p>
                <el-input
                    size="medium"
                    placeholder="请输入内容"
                    suffix-icon="el-icon-search">
                </el-input>
                </div>
                <div class="input_wrap">
                    <P>专业：</P>
                    <el-select size="medium" v-model="queryParams.majorId" placeholder="请选择">
                        <el-option
                        v-for="item in majorList"
                        :key="item.id"
                        :label="item.majorName"
                        :value="item.id">
                        </el-option>
                    </el-select>
                </div>
                <div class="input_wrap">
                    <P>课程：</P>
                    <el-select size="medium" v-model="queryParams.subjectId" placeholder="请选择">
                        <el-option
                        v-for="item in subjectList"
                        :key="item.id"
                        :label="item.name"
                        :value="item.id">
                        </el-option>
                    </el-select>
                </div>
                <div class="input_wrap">
                    <P>状态：</P>
                    <el-select size="medium" v-model="queryParams.isChecked" placeholder="请选择">
                        <el-option label="审核中" :value="0"></el-option>
                        <el-option label="未通过" :value="-1"></el-option>
                        <el-option label="已通过" :value="1"></el-option>
                    </el-select>
                </div>
                <el-button type="primary" size="medium" @click="getPaperRecordList()">搜索记录</el-button>
                <el-button type="success" size="medium" @click="reset()">重置</el-button>
            </div>
        </el-card>
        <el-card shadow="never">
            <div class="list_wrap">
                <div
                    v-for="(item,index) of recordList"
                    :key="index"
                    class="list_item">
                    <div class="title_btn_wrap">    
                        <div class="title">{{ item.paperTitle }}</div>
                        <div class="btn_wrap">
                            <el-button v-if="item.paperStatus == -2" size="mini" type="danger" plain :disabled="true" >未参加考试</el-button>
                            <el-button v-else size="mini" type="primary" plain :disabled="!isObsolete(item.examDateEnd)" @click="showPaperQuestionHandle(item)">查看试卷</el-button>
                        </div>
                    </div>
                    <div class="major_info_wrap info_wrap">
                        <p>出题人:<span>{{ item.createBy }}</span></p>
                        <p>专业:<span>{{ item.majorName }}</span></p>
                        <p>课程:<span>{{ item.subjectName }}</span></p>
                        <p>班级:<span>{{ item.className }}</span></p>
                    </div>
                    <div class="info_wrap">
                        <p>
                            难度:
                            <span>
                                <StartRating v-model="item.difficulty" :disabled="true"/>
                            </span>
                        </p>
                    </div>
                    <div class="info_wrap">
                        <p>
                            考试时间:
                            <span>{{ item.examDateEnd }} - {{ item.examDateStart }}</span>
                        </p>
                    </div>
                    <div class="paper_time_wrap info_wrap">
                        <p>总分:<span>{{ item.totalPoint }}</span></p>
                        <p>及格:<span>{{ item.passMark }}</span></p>
                        <p><i class="el-icon-alarm-clock"></i><span>120</span></p>
                    </div>
                    <div class="exam_info_wrap info_wrap">
                        <p>题目数量:<span>100</span></p>
                        <p v-if="item.paperStatus != 0" >正确数:<span>{{ item.correctNum }}</span></p>
                        <p v-if="item.paperStatus != 0">考试得分:<span>{{ item.examScore }}</span></p>
                    </div>
                    <div class="sumit_time_wrap info_wrap">
                        <p>提交时间:<span>{{ item.submitTime }}</span></p>
                    </div>
                    <div class="identify_wrap">
                        <i v-if="item.paperStatus == 0" class="iconfont icon-shenhezhong"></i>
                        <i v-else-if="item.paperStatus == -1 || item.paperStatus == -2" class="iconfont icon-weitongguo"></i>
                        <i v-else class="iconfont icon-yitongguo"></i>
                    </div>
                </div>
            </div>
            <div class="pagination_wrap">
                <el-pagination
                    @current-change="handleCurrentChange"
                    :current-page.sync="paginationParams.pageNo"
                    :page-size="paginationParams.pageSize"
                    background
                    layout="prev, pager, next"
                    :total="paginationParams.total">
                </el-pagination>
            </div>
        </el-card>
        <ExamRecordQuestionModel ref="examRecordQuestion" v-if="examRecordQuestionVisible" />
    </div>
</template>
<script>
import {
    queryPaperRecordList
} from '@/api/paperRecord'
import {
  majorList
} from '@/api/major'
import {
  subjectList
} from '@/api/subject'
import {
  clazzList
} from '@/api/clazz'
import StartRating from '@/components/StartRating.vue'
import ExamRecordQuestionModel from './model/ExamRecordQuestionModel.vue'
export default {
    components: {
        StartRating,
        ExamRecordQuestionModel
    },
    data() {
        return {
            value: '',
            queryParams: {
                paperTitle: '',
                majorId: null,
                subjectId: null,
                isChecked: null
            },
            paginationParams: {
                pageNo: 1,
                pageSize: 10,
                total: 0
            },
            recordList: [],
            majorList: [],
            subjectList: [],
            clazzList: [],
            examRecordQuestionVisible: false
        }
    },
    created() {
        this.getPaperRecordList()
        this.initRelation()
    },
    methods: {
        reset() {
            this.queryParams = {
                paperTitle: '',
                majorId: null,
                subjectId: null,
                isChecked: null,
            }
            this.getPaperRecordList(1)
        },
        getPaperRecordList(num) {
            if (num == 1) {
                this.queryParams.pageNo = 1    
            } else {
                this.queryParams.pageNo = this.paginationParams.pageNo
            }
            this.queryParams.pageSize = this.paginationParams.pageSize
            queryPaperRecordList(this.queryParams).then(res => {
                console.log(res)
                if (res.code == 0) {
                    let data = res.data
                    this.recordList = data.records
                    this.paginationParams.total = data.total
                }
            })
        },
        initRelation() {
            majorList().then(res => {
                if (res.code == 0) {
                this.majorList = res.data
                }
            })
            subjectList().then(res => {
                if (res.code == 0) {
                this.subjectList = res.data
                }
            })
            clazzList().then(res => {
                if (res.code == 0) {
                this.clazzList = res.data
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
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.getPaperRecordList()
        },
        showPaperQuestionHandle(item) {
            
            this.examRecordQuestionVisible = true
            this.$nextTick(()=>{
                this.$refs.examRecordQuestion.init(item.paperRecordId)
            })
        }
    }
}
</script>
<style lang="scss">
.exam_record{
    width: 1450px;
    margin: 0 auto;
    padding-top: 30px;
    .search_wrap{
        display: flex;
        .input_wrap{
        display: flex;
        align-items: center;
        padding-right: 10px;
        .el-scrollbar{
            padding-bottom: 10px;
        }
        &>p{
            width: 50px;
            text-align: end;
        }
        .el-input{
            // width: 30%;
        }
        }
        .el-button{
            margin-left: 10px;
        }
    }
    .list_wrap{
        .list_item{
            border: 1px solid #ccc;
            padding: 10px;
            padding-left: 20px;
            border-radius: 5px;
            box-shadow: 5px 5px 5px #eee;
            margin-bottom: 20px;
            position: relative;
            .title_btn_wrap{
                display: flex;
                align-items: center;
                .title{
                    width: 90%;
                    font-size: 16px;
                    font-family: Arial, Helvetica, sans-serif;
                    font-weight: bold;

                    /*1. 先强制一行内显示文本*/
                    white-space: nowrap;
                    /*2. 超出的部分隐藏*/
                    overflow: hidden;
                    /*3. 文字用省略号替代超出的部分*/
                    text-overflow: ellipsis;
                }
                .btn_wrap{
                    width: 10%;
                    text-align: center;
                    .el-button{
                        padding: 5px 10px;
                        span{
                            font-size: 12px;
                        }
                    }
                }
            }
            .info_wrap{
                display: flex;
                align-items: center;
                p{
                    font-size: 12px;
                    color: #636e72;
                    margin-top: 5px;
                    margin-right: 15px;
                    display: flex;
                    align-items: center;
                    i{
                    }
                    &>span{
                        font-size: 12px;
                        padding-left: 5px;
                    }
                }
            }
            .identify_wrap{
                position: absolute;
                // top: 10%;
                // right: 15%;
                top: 50%;
                left: 80%;
                transform: translate(-50%, -50%);
                i{
                    font-size: 100px;
                }
                .icon-shenhezhong{
                    color: #409EFF;
                }
                .icon-weitongguo{
                    color: #F56C6C;
                }   
                .icon-yitongguo{
                    color: #67C23A;
                }
            }
            .start_rating_wrap{
                font-size: 12px;
                color: #636e72;
                display: flex;
                margin-top: 5px;
                &>span{
                    padding-right: 5px;
                }
            }
        }
    }
    .pagination_wrap{
        margin-top: 30px;
        text-align: end;
    }
}
</style>