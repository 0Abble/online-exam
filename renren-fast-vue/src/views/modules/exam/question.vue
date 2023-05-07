<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item label="题目">
        <el-input v-model="dataForm.key" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item label="题目类型">
        <el-select v-model="dataForm.typeId" placeholder="请选择">
            <el-option
              v-for="item in questTypeList"
              :key="item.id"
              :label="item.typeName"
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
    </el-form>
    <div class="btn_wrap">
      <el-button @click="getDataList()" type="primary">查询</el-button>
      <el-button @click="reset()">重置</el-button>
      <el-button v-if="isAuth('exam:question:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
      <el-button v-if="isAuth('exam:question:delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      <el-button  type="success">导出</el-button>
      <el-button  type="success">导入</el-button>

    </div>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%; margin-top: 30px;">
      <el-table-column type="expand">
        <template slot-scope="{row}">
          <QuestionExpand :question="row"/>
        </template>
      </el-table-column>
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
        prop="questionTypeId"
        header-align="center"
        align="center"
        label="题目类型">
        <template slot-scope="{row}">
          <template v-for="item of questTypeList">
            <span :key="item.id" v-if="row.questionTypeId == item.id">{{ item.typeName }}</span>
          </template>
        </template>
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
        prop="questionTitle"
        header-align="center"
        label="问题题目"
        width="300"
        :show-overflow-tooltip="true">
      </el-table-column>
      <el-table-column
        prop="analyse"
        header-align="center"
        label="题目分析"
        width="300"
        :show-overflow-tooltip="true">
      </el-table-column>

      <el-table-column
        prop="difficulty"
        header-align="center"
        align="center"
        label="题目难度">
      </el-table-column>
      <el-table-column
        prop="score"
        header-align="center"
        align="center"
        label="题目分数">
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
    getAllSubject
  } from '@/api/exam/subject'

  import {
    getAllQuestType
  } from '@/api/exam/questType'

  import AddOrUpdate from './question-add-or-update'
  import QuestionExpand from './components/QuestionExpand.vue'
  export default {
    data () {
      return {
        dataForm: {
          key: '',
          typeId: '',
          subjectId: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false,
        subjectList: [],
        questTypeList: []
      }
    },
    components: {
      AddOrUpdate,
      QuestionExpand
    },
    activated () {
      this.getDataList()
    },
    created() {
      this.getAllSubject()
      this.getAllQuestType()
    },
    methods: {
      reset() {
        this.dataForm = {
          key: '',
          typeId: '',
          subjectId: ''
        }
        this.pageSize = 10
        this.totalPage = 0
        this.getDataList()
      },
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/exam/question/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'key': this.dataForm.key,
            'typeId': this.dataForm.typeId,
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
      getAllSubject() {
        getAllSubject().then(res => {
          if (res.code == 0) {
            this.subjectList = res.data
          } else {
            return this.$message.error(res.msg)
          }
        })
      },
      getAllQuestType() {
        getAllQuestType().then(res => {
          if (res.code == 0) {
            this.questTypeList = res.data
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
            url: this.$http.adornUrl('/exam/question/delete'),
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
