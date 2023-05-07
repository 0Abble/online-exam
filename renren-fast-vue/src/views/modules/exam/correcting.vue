<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item label="试卷题目">
        <el-input v-model="dataForm.paperTitle" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item label="专业">
        <el-select v-model="dataForm.majorId" placeholder="请选择">
          <el-option
            v-for="item in majotList"
            :key="item.id"
            :label="item.majorName"
            :value="item.majorName">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="课程">
        <el-select v-model="dataForm.subjectId" placeholder="请选择">
          <el-option
            v-for="item in subjectList"
            :key="item.id"
            :label="item.name"
            :value="item.name">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="班级">
        <el-select v-model="dataForm.clazzId" placeholder="请选择">
          <el-option
            v-for="item in clazzList"
            :key="item.id"
            :label="item.className"
            :value="item.className">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="试卷状态">
        <el-select v-model="dataForm.isChecked" placeholder="请选择">
          <el-option label="改卷中" :value="0"></el-option>
          <el-option label="未及格" :value="-1"></el-option>
          <el-option label="已及格" :value="1"></el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <div class="btn-wrap">
      <el-button type="primary" @click="getDataList()">查询</el-button>
      <el-button type="success" @click="reset()">重置</el-button>
      <!-- <el-button v-if="isAuth('exam:correcting:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button> -->
      <!-- <el-button v-if="isAuth('exam:correcting:delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button> -->
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
        label="试卷题目"
        width="200"
        :show-overflow-tooltip="true">
      </el-table-column>

      <el-table-column
        prop="questionNum"
        header-align="center"
        align="center"
        label="题目数量"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="correctNum"
        header-align="center"
        align="center"
        label="正确数"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="examScore"
        header-align="center"
        align="center"
        label="考试得分"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="passMark"
        header-align="center"
        align="center"
        label="及格分数"
        width="150"
      >
      </el-table-column>
      <el-table-column
        prop="paperStatus"
        header-align="center"
        align="center"
        label="试卷状态"
        width="150"
      >
        <template slot-scope="{row}">
          <el-tag v-if="row.paperStatus == 0">改卷中</el-tag>
          <el-tag v-else-if="row.paperStatus == 1" type="success">已及格</el-tag>
          <el-tag v-else type="danger">未及格</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="stuNo"
        header-align="center"
        align="center"
        label="学生学号"
        width="200"
        :show-overflow-tooltip="true"
        >
      </el-table-column>
      <el-table-column
        prop="stuName"
        header-align="center"
        align="center"
        label="学生姓名"
        width="150"
        :show-overflow-tooltip="true"
      ></el-table-column>
      <el-table-column
        prop="className"
        header-align="center"
        align="center"
        label="班级"
        width="150"
        :show-overflow-tooltip="true"
      ></el-table-column>
      <el-table-column
        prop="majorName"
        header-align="center"
        align="center"
        label="专业"
        width="150"
        :show-overflow-tooltip="true"
      ></el-table-column>
      <el-table-column
        prop="subjectName"
        header-align="center"
        align="center"
        label="课程"
        width="150"
        :show-overflow-tooltip="true"
      ></el-table-column>
      <el-table-column
        prop="submitTime"
        header-align="center"
        align="center"
        label="提交时间"
        width="150"
        :show-overflow-tooltip="true"
      ></el-table-column>

      <el-table-column
        prop="description"
        header-align="center"
        align="center"
        label="试卷描述"
        width="200"
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
        width="80"
        label="操作">
        <template slot-scope="scope">
          <el-button size="small" @click="addOrUpdateHandle(scope.row.paperRecordId)" type="primary" plain>批改</el-button>
          <!-- <el-button type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button> -->
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
  </div>
</template>

<script>
  import {
    queryPaperCorrecting
  } from '@/api/exam/paper'
  import {
    getAllMajor
  } from '@/api/exam/major'

  import {
    getAllSubject
  } from '@/api/exam/subject'
  import {
    getAllClazz
  } from '@/api/exam/clazz'
  import AddOrUpdate from './correcting-add-or-update'
  export default {
    data () {
      return {
        dataForm: {
          key: '',
          paperTitle: '',
          majorId: null,
          subjectId: null,
          isChecked: null,
          clazzId: null,
          stuNo: '',
          stuName: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false,
        //
        majotList: [],
        subjectList: [],
        clazzList: []
      }
    },
    components: {
      AddOrUpdate
    },
    activated () {
      this.getDataList()
    },
    created() {
      this.initData()
    },
    methods: {
      reset() {
        this.dataForm = {
          key: '',
          paperTitle: '',
          majorId: null,
          subjectId: null,
          isChecked: null,
          clazzId: null,
          stuNo: '',
          stuName: ''
        }
        this.pageIndex = 1
        this.pageSize = 10
        this.getDataList()
      },
      // 获取数据列表
      getDataList() {
        this.dataListLoading = true
        queryPaperCorrecting({
          ...this.dataForm,
          'pageNo': this.pageIndex,
          'pageSize': this.pageSize
        }).then(res => {
          if (res.code == 0) {
            let data = res.data
            console.log(data)
            this.dataList = data.records
            this.totalPage = data.total
            this.dataListLoading = false
          } else {
            return this.$message.error(res.msg)
          }
        })
      },
      initData() {
        getAllMajor().then(res => {
          if (res.code === 0) {
            this.majotList = res.data
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
        getAllClazz().then(res => {
          if (res.code == 0) {
            this.clazzList = res.data
          }
        })
      },
      getDataList2 () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/exam/paperrecord/list'),
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
            url: this.$http.adornUrl('/exam/paperrecord/delete'),
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
