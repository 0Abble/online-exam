<template>
  <div class="paper_container">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item label="试卷名">
        <el-input v-model="dataForm.title" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item label="专业">
        <el-select v-model="dataForm.major" placeholder="请选择">
          <el-option
            v-for="item in majotList"
            :key="item.id"
            :label="item.majorName"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="课程">
        <el-select v-model="dataForm.subjectId" placeholder="请选择">
            <el-option
              v-for="item in subjectList"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth('exam:paper:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth('exam:paper:delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </el-form-item>
    </el-form>
    <el-table
      ref="paperTable"
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%;">
      <el-table-column
        type="selection"
        header-align="center"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        label="序号"
        type="index"
        header-align="center"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="majorId"
        header-align="center"
        align="center"
        label="专业"
        width="150"
        :show-overflow-tooltip="true">
        <template slot-scope="{row}">
          <template v-for="item of majotList">
            <span v-if="item.id == row.majorId" :key="item.id">{{ item.majorName }}</span>
          </template>
        </template>
      </el-table-column>
      <el-table-column
        prop="subjectId"
        header-align="center"
        align="center"
        label="科目"
        width="150"
        :show-overflow-tooltip="true">
        <template slot-scope="{row}">
          <template v-for="item of subjectList">
            <span :key="item.id" v-if="row.subjectId == item.id">{{ item.name }}</span>
          </template>
        </template>
      </el-table-column>
      <el-table-column
        prop="paperTitle"
        header-align="center"
        align="center"
        label="试卷标题"
        width="200"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="difficulty"
        header-align="center"
        align="center"
        label="试卷难度"
        width="200">
        <template slot-scope="{row}">
          <div class="difficulty_wrap">
            <StartRating v-model="row.difficulty" :disabled="true"/>
          </div>
        </template>
      </el-table-column>
      <el-table-column
        prop="answerNum"
        header-align="center"
        align="center"
        label="答题次数"
        width="100">
      </el-table-column>
      <el-table-column
        prop="questionNum"
        header-align="center"
        align="center"
        label="题目数量"
        width="100">
      </el-table-column>
      <el-table-column
        prop="isChecked"
        header-align="center"
        align="center"
        label="审核状态"
        width="150">
        <template slot-scope="{row}">
          <el-tag v-if="row.isChecked == -1" type="danger">审核未通过</el-tag>
          <el-tag v-else-if="row.isChecked == 1" type="success">审核通过</el-tag>
          <el-tag v-else>审核中</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="examTime"
        header-align="center"
        align="center"
        width="150"
        label="考试时间（分）">
      </el-table-column>
      <el-table-column
        prop="totalPoint"
        header-align="center"
        align="center"
        label="总分">
      </el-table-column>
      <el-table-column
        prop="passMark"
        header-align="center"
        align="center"
        label="及格分数">
      </el-table-column>
      <el-table-column
        prop="examDateStart"
        header-align="center"
        align="center"
        label="考试开始日期"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="examDateEnd"
        header-align="center"
        align="center"
        label="考试结束日期"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="description"
        header-align="center"
        align="center"
        label="描述"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="createBy"
        header-align="center"
        align="center"
        label="创建人">
      </el-table-column>
      <el-table-column
        prop="updateBy"
        header-align="center"
        align="center"
        label="修改人">
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        label="创建时间"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="updateTime"
        header-align="center"
        align="center"
        label="修改时间"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        fixed="right"
        header-align="center"
        align="center"
        width="180"
        label="操作">
        <template slot-scope="scope">
          <!-- <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.id)">修改</el-button> -->
          <el-button type="text" size="small" @click="showPaperInfo(scope.row)">查看</el-button>
          <el-button type="text" size="small" v-if="scope.row.isChecked == -1" @click="showDistributionExpand(scope.row)">审核信息</el-button>
          <el-button type="text" size="small" v-if="scope.row.isChecked == 1" @click="showDistributionExpand(scope.row)">分配</el-button>
          <el-button type="text" size="small" v-if="scope.row.isChecked == 1" @click="exportPaperInfo(scope.row)">导出</el-button>
          <el-button type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
      <el-table-column width="1" type="expand">
        <template slot-scope="{row}">
          <paper-expand :paperInfo="row" />
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageIndex"
      :page-sizes="[10, 20, 50, 100]"
      :page-size="pageSize"
      :total="totalPage"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"></add-or-update>
    <paper-info v-if="showPaperInfoVisible" ref="showPaperInfo" />
  </div>
</template>

<script>

  import {
    getAllMajor
  } from '@/api/exam/major'

  import {
    getAllSubject
  } from '@/api/exam/subject'

  import {
    exportPaperPdf
  } from '@/api/exam/paper'

  import PaperExpand from './components/PaperExpand.vue'
  import AddOrUpdate from './paper-add-or-update'
  import PaperInfo from './components/PaperInfo.vue'

  import StartRating from './components/StartRating.vue'
  export default {
    data () {
      return {
        dataForm: {
          key: '',
          title: '',
          major: '',
          subjectId: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false,
        majotList: [],
        subjectList: [],
        showPaperInfoVisible: false,
      }
    },
    components: {
      AddOrUpdate,
      PaperInfo,
      PaperExpand,
      StartRating
    },
    activated () {
      this.getDataList()
    },
    created() {
      this.getAllMajor()
      this.getAllSubject()
    },
    methods: {
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
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/exam/paper/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'key': this.dataForm.key,
            'title': this.dataForm.title,
            'major': this.dataForm.major,
            'subjectId': this.dataForm.subjectId
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.dataList = data.page.list
            this.totalPage = data.page.totalCount
          } else {
            this.dataList = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
      },
      // 每页数
      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      // 当前页
      currentChangeHandle (val) {
        this.pageIndex = val
        this.getDataList()
      },
      // 多选
      selectionChangeHandle (val) {
        this.dataListSelections = val
      },
      // 新增 / 修改
      addOrUpdateHandle (id) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init(id)
        })
      },
      // 删除
      deleteHandle (id) {
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.id
        })
        var titles = id ? this.dataList.map(item => {
          if (item.id == id) {
            return item.paperTitle
          }
        }): this.dataList.map(item => {
          return item.paperTitle
        })
        this.$confirm(`确定对[名称=${titles.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/exam/paper/delete'),
            method: 'post',
            data: this.$http.adornData(ids, false)
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.getDataList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        })
      },
      // 点击查看 查看试卷信息
      showPaperInfo(row) {
        this.showPaperInfoVisible = true
        this.$nextTick(() => {
          this.$refs.showPaperInfo.init(row.id)
        })
      },
      //点击分配 展开
      showDistributionExpand(row) {
        this.$refs.paperTable.toggleRowExpansion(row)
      },
      exportPaperInfo(paper) {
        exportPaperPdf(paper.id).then(res => {
          if (typeof window.navigator.msSaveBlob !== 'undefined') {
            window.navigator.msSaveBlob(new Blob([res]), paper.paperTitle+'.pdf')
          } else {
            let url = window.URL.createObjectURL(new Blob([res]))
            let link = document.createElement('a')
            link.style.display = 'none'
            link.href = url
            link.setAttribute('download', paper.paperTitle+'.pdf')
            document.body.appendChild(link)
            link.click()
            document.body.removeChild(link) // 下载完异常元素
            window.URL.revokeObjectURL(url) // 释放掉blob对象
          }
        })
      }
    }
  }
</script>
<style lang="scss">
.paper_container{
  .difficulty_wrap{
    display: flex;
    justify-content: center;
  }
}
</style>
