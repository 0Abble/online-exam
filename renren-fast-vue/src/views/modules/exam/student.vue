<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" label-width="80px">
      <el-form-item label="学号">
        <el-input v-model="dataForm.stuNo" placeholder="学号" clearable></el-input>
      </el-form-item>

      <el-form-item label="姓名">
        <el-input v-model="dataForm.stuName" placeholder="姓名" clearable></el-input>
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

      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <el-button type="primary" @click="resestSearchHandle()">重置</el-button>
        <el-button v-if="isAuth('exam:student:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth('exam:student:delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </el-form-item>
    </el-form>
    <el-table
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
        label="姓名">
      </el-table-column>
      <!-- <el-table-column
        prop="grade"
        header-align="center"
        align="center"
        label="年级">
      </el-table-column> -->
      <el-table-column
        prop="major"
        header-align="center"
        align="center"
        label="专业"
        width="150"
        :show-overflow-tooltip="true"
        >
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
        :show-overflow-tooltip="true"
        >
        <template slot-scope="{row}">
          <template v-for="item of clazzList">
            <span :key="item.id" v-if="item.id == row.clazz">{{ item.className }}</span>
          </template>
        </template>
      </el-table-column>
      <el-table-column
        prop="institute"
        header-align="center"
        align="center"
        label="学院"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="tel"
        header-align="center"
        align="center"
        label="电话号码"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="email"
        header-align="center"
        align="center"
        label="电子邮件"
        width="150"
          :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="pwd"
        header-align="center"
        align="center"
        label="密码">
      </el-table-column>
      <el-table-column
        prop="cardid"
        header-align="center"
        align="center"
        label="身份证号"
        width="150"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="sex"
        header-align="center"
        align="center"
        label="性别">
      </el-table-column>
      <el-table-column
        prop="description"
        header-align="center"
        align="center"
        label="描述">
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
        width="150"
        label="操作">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
          <el-button type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
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
    getAllMajor
  } from '@/api/exam/major'

  import {
    getAllClazz
  } from '@/api/exam/clazz'

  import AddOrUpdate from './student-add-or-update'
import { timingSafeEqual } from 'crypto'
  export default {
    data () {
      return {
        dataForm: {
          key: '',
          stuNo: '',
          stuName: '',
          major: null,
          clazz: null
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false,
        majotList: [],
        clazzList: []
      }
    },
    components: {
      AddOrUpdate
    },
    activated () {
      this.getDataList()
    },
    created()  {
      this.getAllMajor()
      this.getAllClazz()
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
      getAllClazz() {
        getAllClazz().then(res => {
          if (res.code == 0) {
            this.clazzList = res.data
          } else {
            return this.$message.error(res.msg)
          }
        })
      },
      resestSearchHandle() {
        this.dataForm ={
          key: '',
          stuNo: '',
          stuName: '',
          major: null,
          clazz: null
        }
        this.pageIndex = 1
        this.pageSize = 10
      },
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/exam/student/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            ...this.dataForm
          })
        }).then(({data}) => {
          console.log(data)
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
            url: this.$http.adornUrl('/exam/student/delete'),
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
