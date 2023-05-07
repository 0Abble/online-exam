<template>
  <div class="mine_paper">
    <el-card shadow="never">
      <div class="search_wrap">
        <div class="input_wrap">
          <p>名称：</p>
          <el-input
            v-model="queryParams.paperTitle"
            size="medium"
            placeholder="请输入内容"
            suffix-icon="el-icon-search">
          </el-input>
        </div>
        <div class="input_wrap">
          <P>专业：</P>
          <el-select size="medium" v-model="queryParams.majorId" placeholder="请选择">
            <el-option
              v-for="(item,index) in majorList"
              :key="index+'mj'"
              :label="item.majorName"
              :value="item.id">
            </el-option>
          </el-select>
        </div>
        <div class="input_wrap">
          <P>课程：</P>
          <el-select size="medium" v-model="queryParams.subjectId" placeholder="请选择">
            <el-option
              v-for="(item,index) in subjectList"
              :key="index+'sbj'"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </div>
        <el-button type="primary" size="medium" @click="getPaperList()">搜索试卷</el-button>
        <el-button type="success" size="medium" @click="reset()">重置</el-button>
      </div>
    </el-card>
    <el-card shadow="never" class="paper_list_card">
      <div class="paper_list_wrap">
        <div 
          class="paper_info_item_wrap"
          v-for="(item,index) of paperList"
          :key="index+'pp'"
        >
          <div class="paper_info_item">
            <p class="paper_title">{{ item.paperTitle }}</p>
            
            <div class="paper_author">出题人：<span>{{ item.updateBy }}</span></div>
            <div class="major_info_wrap">
              <p>专业:
                <template v-for="major of majorList">
                  <span :key="major.id" v-if="major.id == item.majorId">{{ major.majorName }}</span>
                </template>
              </p>
              <p>课程:
                <template v-for="subject of subjectList">
                  <span :key="subject.id" v-if="subject.id == item.subjectId">{{ subject.name }}</span>
                </template>
              </p>
              <p>班级:
                <template v-for="clazz of clazzList">
                  <span :key="clazz.id" v-if="clazz.id == user.clazz">{{ clazz.className }}</span>
                </template>
              </p>
            </div>
            <div class="start_rating_wrap">
              <span>试卷难度:</span>
              <StartRating v-model="item.difficulty" :disabled="true"/>
            </div>
            <div class="paper_time_wrap">
              <p>总分: <span>{{ item.totalPoint }}</span></p>
              <p>及格: <span>{{ item.passMark }}</span></p>
              <p><i class="el-icon-alarm-clock"></i><span>{{ item.examTime }}</span></p>
            </div>
            <div class="paper_date_range">
              <i class="el-icon-date"></i>
              <p>{{ item.examDateStart }}</p>
              <span>-</span>
              <p>{{ item.examDateEnd }}</p>
            </div>
            <div class="btn_wrap">
              <p>剩余答题次数: <span>{{ item.answerNum }}</span></p>
              <el-tag v-if="isObsolete(item.examDateEnd)" type="danger">已过期</el-tag>
              <el-tag v-else-if="isExamNonStart(item.examDateStart)" type="success">考试未开始</el-tag>
              <el-button v-else-if="item.answerNum > 0" size="mini" type="primary" plain @click="answerQuestionHanle(item.id)">开始答题</el-button>
              <el-tag v-else type="danger">已答题</el-tag>
            </div>
          </div>
        </div>
      </div>
      <div class="pagination_wrap">
        <el-pagination
          @current-change="handleCurrentChange"
          :current-page.sync="pageParams.pageNo"
          :page-size="pageParams.pageSize"
          background
          layout="prev, pager, next"
          :total="pageParams.total">
        </el-pagination>
      </div>
    </el-card>
    <!-- <ExamRecordQuestionModel ref="examRecordQuestion" v-if="examRecordQuestionVisible" /> -->
  </div>
</template>
<script>
import{
  getPaperList
} from '@/api/paper'
import {
  majorList
} from '@/api/major'
import {
  subjectList
} from '@/api/subject'
import {
  clazzList
} from '@/api/clazz'
import {
  saveObsoletePaper
} from '@/api/paperRecord'
import { mapState,mapMutations } from 'vuex'
import StartRating from '@/components/StartRating.vue'
import ExamRecordQuestionModel from './model/ExamRecordQuestionModel.vue'

export default {
  name: 'minePaper',
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
      },
      majorList: [],
      paperList: [],
      subjectList: [],
      clazzList: [],
      pageParams: {
        pageNo: 1,
        pageSize: 10,
        total: 0
      },
      beOverduePaperIds: [],
      splitChar: "∧",
      examRecordQuestionVisible: false
    }
  },
  computed: {
    ...mapState(['user']),
   
  },
  created() {
    this.initRelation()
    this.getPaperList()
    this.getMajorList()
    this.getSubjectList()
    this.getClazzList()
  }, 
  methods: {
    reset() {
        this.queryParams = {
            paperTitle: '',
            majorId: null,
            subjectId: null
        }
        this.getPaperList(1)
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
    getPaperList() {
      getPaperList({
        ...this.queryParams,
        pageNo: this.pageParams.pageNo,
        pageSize: this.pageParams.pageSize
      }).then(res => {
        if (res.code == 0) {
          this.paperList = res.data.records
          this.pageParams.total = res.data.total
          this.paperList.forEach(item => {
            if (this.isObsolete(item.examDateEnd)) {
              this.beOverduePaperIds.push(item.id)
            }
          })
          saveObsoletePaper(this.beOverduePaperIds.join(this.splitChar)).then(res => {
          })
        } else {
          return this.$message.error(res.msg)
        }
      })
    },
    getMajorList() {
      majorList().then(res => {
        if (res.code == 0) {
          this.majorList = res.data
        }
      })
    },
    getSubjectList() {
      subjectList().then(res => {
        if (res.code == 0) {
          this.subjectList = res.data
        }
      })
    },
    getClazzList() {
      clazzList().then(res => {
        if (res.code == 0) {
          this.clazzList = res.data
        }
      })
    },
    isExamNonStart(startDate) {
      let dateTimeList = startDate.split('-')
      let date = new Date()
      if (parseInt(dateTimeList[0]) > date.getFullYear()) {
        return true
      }
      if (parseInt(dateTimeList[1]) > (date.getMonth() + 1)) {
        return true
      }
      if (parseInt(dateTimeList[2]) > date.getDate()) {
        return true
      }
      return false
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
    answerQuestionHanle(paperId) {
      this.$router.push('/answer/'+paperId)
    },
    handleCurrentChange(val) {
      console.log(`当前页: ${val}`);
    },
    // showPaperQuestionHandle(item) {    
    //     this.examRecordQuestionVisible = true
    //     this.$nextTick(()=>{
    //         this.$refs.examRecordQuestion.init(item.paperRecordId)
    //     })
    // }
  }
}
</script>
<style lang="scss">
.mine_paper{
  width: 1450px;
  margin: 0 auto;
  margin-top: 30px;
  .search_wrap{
    display: flex;
    .input_wrap{
      display: flex;
      align-items: center;
      padding-right: 10px;
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
  .paper_list_card{
    min-height: 50vh;
  }
  .paper_list_wrap{
    display: flex;
    flex-wrap: wrap;
    .paper_info_item_wrap{
      width: 25%;
    }
    .paper_info_item{
      border: 1px solid #ccc;
      border-radius: 5px;
      margin: 15px;
      padding: 10px;
      transition: all 0.2s ease;
      cursor: pointer;
      box-shadow: 5px 5px 5px #eee;
      &:hover{
        box-shadow: 5px 5px 5px #ccc;
        .paper_title {
          color: #e17055;
        }
      }
      .paper_title{
        font-weight: bold;
        transition: all 0.2s ease;
        /*1. 先强制一行内显示文本*/
        white-space: nowrap;
        /*2. 超出的部分隐藏*/
        overflow: hidden;
        /*3. 文字用省略号替代超出的部分*/
        text-overflow: ellipsis;
        font-size: 16px;
      }
      .major_info_wrap{
        p{
          font-size: 13px;
          color: #636e72;
          margin: 5px 0;
          span{

          }
        }
      }
      .start_rating_wrap{
        display: flex;
        align-items: center;
        color: #636e72;
        font-size: 13px;
        margin-bottom: 5px;
        span{
          padding-right: 5px;
        }
      }
      .paper_date_range{
        display: flex;
        align-items: center;
        margin: 5px 0;
        i{
          font-size: 14px;
          padding-right: 5px;
        }
        span{
          padding: 0 5px;
        }
        p{
          font-size: 13px;
          color: #636e72;
        }
      }
      .paper_author{
        font-size: 13px;
        color: #636e72;
        margin: 5px 0;
        span{

        }
      }
      .paper_description{
        font-size: 12px;
        color: #636e72;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
        text-overflow: ellipsis;
      }
      .paper_time_wrap{
        display: flex;
        align-items: center;
        p{
          font-size: 12px;
          color: #636e72;
          display: flex;
          align-items: center;
          padding-right: 10px;
          span{
            font-size: 12px;
            padding-left: 3px;
          }
        }
      }
      .btn_wrap{
        padding: 5px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        &>p{
          display: flex;
          align-items: center;
          span{
            padding-left: 5px;
          }
        }
      }
    }
  }
  .pagination_wrap{
    text-align: center;
    margin-top: 30px;
  }
}
</style>