<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.title" placeholder="试卷名" clearable></el-input>
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
        <el-button type="success" size="small" @click="reset()">重置</el-button>
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
        label="试卷标题"
        width="200"
        :show-overflow-tooltip="true">
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
        prop="answerNum"
        header-align="center"
        align="center"
        label="答题次数"
      >
      </el-table-column>
      <el-table-column
        prop="questionNum"
        header-align="center"
        align="center"
        label="题目数量"
      >
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
        prop="difficulty"
        header-align="center"
        align="center"
        label="难度"
        width="150">
        <template slot-scope="{row}">
          <div class="difficulty_wrap">
            <StartRating v-model="row.difficulty" :disabled="true"/>
          </div>
        </template>
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
          <el-button type="text" size="small" @click="checkPaperPass(scope.row)">通过</el-button>
          <el-button type="text" size="small" @click="checkPaperNoPass(scope.row)">不通过</el-button>
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
    <paper-info v-if="showPaperInfoVisible" ref="showPaperInfo" />
    <el-dialog
      title="不通过理由"
      :close-on-click-modal="false"
      :visible.sync="visible"
      @close="checkMsgDialogClose">
      <WangEditor v-model="editorValue"/>
      <span slot="footer" class="dialog-footer">
        <el-button @click="visible = false">取消</el-button>
        <el-button type="primary" @click="paperCheckMsgConfirm()">确定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
  import {
    getAllMajor
  } from '@/api/exam/major'

  import {
    getAllSubject
  } from '@/api/exam/subject'

  import AddOrUpdate from './paper-add-or-update'
  import PaperInfo from './components/PaperInfo.vue'

  import WangEditor from '@/components/WangEditor.vue'
  import StartRating from './components/StartRating.vue'
  export default {
    data () {
      return {
        dataForm: {
          key: '',
          title:'' ,
          major: '',
          subjectId: '',
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
        visible: false,
        editorValue: '',
        tempRowId: null

      }
    },
    components: {
      AddOrUpdate,
      PaperInfo,
      WangEditor,
      StartRating
    },
    activated () {
      this.getDataList()
    },
    created() {
      this.getAllMajor()
      this.getAllSubject()
    },
    mounted() {
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
      reset() {
        this.dataForm = {
          key: '',
          title:'' ,
          major: '',
          subjectId: '',
        }
        this.pageIndex = 1
        this.pageSize = 10
        this.getDataList()
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
            'isNoChecked': 1,
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
      // 点击查看 查看试卷信息
      showPaperInfo(row) {
        this.showPaperInfoVisible = true
        this.$nextTick(() => {
          this.$refs.showPaperInfo.init(row.id)
        })
      },
      // 点击通过
      checkPaperPass(row) {
        this.$http({
          url: this.$http.adornUrl('/exam/paper/update'),
          method: 'post',
          data: this.$http.adornData({
            'id': row.id,
            'isChecked': 1
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.getDataList()
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      // 点击不通过
      checkPaperNoPass(row) {
        this.tempRowId = row.id
        this.editorValue = row.checkMsg
        this.visible = true
      },
      checkMsgDialogClose() {
        this.visible = false
        this.editorValue = ''
        this.tempRowId = null
      },
      paperCheckMsgConfirm() {
        this.$http({
          url: this.$http.adornUrl('/exam/paper/update'),
          method: 'post',
          data: this.$http.adornData({
            'id': this.tempRowId,
            'isChecked': -1,
            'checkMsg': this.editorValue
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.getDataList()
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
            })
            this.checkMsgDialogClose
          } else {
            this.$message.error(data.msg)
          }
        })
      }
    }
  }
</script>
