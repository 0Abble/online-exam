<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" label-width="80px">
      <el-form-item label="试卷名">
        <el-input v-model="dataForm.paperTitle" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item label="学生姓名">
        <el-input v-model="dataForm.stuName" placeholder="参数名" clearable></el-input>
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

      <el-form-item label="班级">
        <el-select v-model="dataForm.clazz" placeholder="请选择" style="width:  92%;">
          <el-option
            v-for="item in clazzList"
            :key="item.id"
            :label="item.className"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <div class="btn-wrap">
      <el-button @click="getDataList()" type="success">查询</el-button>
      <el-button @click="reset()" type="primary">重置</el-button>
    </div>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%; margin-top: 20px;">
      <el-table-column
        label="序号"
        type="index"
        header-align="center"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="paperTitle"
        header-align="center"
        align="center"
        label="试卷名称"
        width="200"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="stuNo"
        header-align="center"
        align="center"
        label="学号"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="stuName"
        header-align="center"
        align="center"
        label="姓名"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="subjectId"
        header-align="center"
        align="center"
        label="课程科目"
        width="150"
        :show-overflow-tooltip="true">
        <template slot-scope="{row}">
          <template v-for="item of subjectList">
            <span :key="item.id" v-if="row.subjectId == item.id">{{ item.name }}</span>
          </template>
        </template>
      </el-table-column>
      <el-table-column
        prop="major"
        header-align="center"
        align="center"
        label="专业"
        width="150"
        :show-overflow-tooltip="true">
        <template slot-scope="{row}">
          <template v-for="item of majotList">
            <span v-if="item.id == row.major" :key="item.id">{{ item.majorName }}</span>
          </template>
        </template>
      </el-table-column>
      <el-table-column
        prop="clazz"
        header-align="center"
        align="center"
        label="班级"
        width="150"
        :show-overflow-tooltip="true">
        <template slot-scope="{row}">
          <template v-for="item of clazzList">
            <span :key="item.id" v-if="item.id == row.clazz">{{ item.className }}</span>
          </template>
        </template>
      </el-table-column>
      <el-table-column
        prop="totalPoint"
        header-align="center"
        align="center"
        label="试卷总分"
        width="100">
      </el-table-column>
      <el-table-column
        prop="passMark"
        header-align="center"
        align="center"
        label="及格分数"
        width="100">
      </el-table-column>
      <el-table-column
        prop="examScore"
        header-align="center"
        align="center"
        label="考试得分"
        width="120">
        <template slot-scope="{row}">
          <el-tag v-if="row.isChecked == -2" type="danger">未参加考试</el-tag>
          <el-tag v-else-if="row.isChecked == 1" type="usccess">{{ row.examScore }}</el-tag>
          <el-tag v-else-if="row.isChecked == -1" type="danger">{{ row.examScore }}</el-tag>
          <el-tag v-else type="info">改卷中</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        label="提交时间"
        width="200"
        :show-overflow-tooltip="true">
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
  </div>
</template>

<script>
import {
  queryStuScorePage
} from '@/api/exam/paper'
import {
    getAllMajor
  } from '@/api/exam/major'

  import {
    getAllClazz
  } from '@/api/exam/clazz'

  import {
    getAllSubject
  } from '@/api/exam/subject'

  import AddOrUpdate from './stuscore-add-or-update'
  export default {
    data () {
      return {
        dataForm: {
          key: '',
          paperTitle: '',
          stuName: '',
          major: null,
          clazz: null,
          subjectId: null
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false,
        majotList: [],
        clazzList: [],
        subjectList: [],
      }
    },
    components: {
      AddOrUpdate
    },
    activated () {
      this.getDataList()
      this.getRelation()
    },
    methods: {
      reset() {
        this.pageIndex = 1
        this.dataForm = {
          key: '',
          paperTitle: '',
          stuName: '',
          major: null,
          clazz: null,
          subjectId: null
        }
      },
      // 获取数据列表
      getDataList() {
        this.dataListLoading = true
        let params = {
          ...this.dataForm,
          'pageNo': this.pageIndex,
          'pageSize': this.pageSize,
        }
        queryStuScorePage(params).then(res => {
          if (res.code == 0) {
            this.dataList = res.data.records
            this.totalPage = res.data.total
          } else {
            return this.$message.error(res.msg)
          }
          this.dataListLoading = false
        })
      },
      getDataList2 () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/exam/stuscore/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'key': this.dataForm.key
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
      getRelation() {
        getAllMajor().then(res => {
          if (res.code === 0) {
            this.majotList = res.data
          } else {
            return this.$message.error(res.msg)
          }
        })
        getAllClazz().then(res => {
          if (res.code == 0) {
            this.clazzList = res.data
          } else {
            return this.$message.error(res.msg)
          }
        })
        getAllSubject().then(res => {
          if (res.code == 0) {
            this.subjectList = res.data
          } else {
            return this.$message.error(res.msg)
          }
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
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/exam/stuscore/delete'),
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
      }
    }
  }
</script>
