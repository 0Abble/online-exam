<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="题目" prop="title">
      <el-input v-model="dataForm.title" placeholder="题目"></el-input>
    </el-form-item>
    <el-form-item label="内容" prop="content">
      <WangEditor v-model="dataForm.content" />
      <!-- <el-input v-model="dataForm.content" placeholder="内容"></el-input> -->
    </el-form-item>
    <!-- <el-form-item label="描述" prop="description">
      <el-input v-model="dataForm.description" placeholder="描述"></el-input>
    </el-form-item> -->
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import WangEditor from '@/components/WangEditor.vue'
  export default {
    components: {
      WangEditor,
    },
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          title: '',
          content: '',
          description: '',
        },
        dataRule: {
          title: [
            { required: true, message: '题目不能为空', trigger: 'blur' }
          ],
          content: [
            { required: true, message: '内容不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/exam/notice/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.title = data.notice.title
                this.dataForm.content = data.notice.content
                this.dataForm.description = data.notice.description
                this.dataForm.isDeleted = data.notice.isDeleted
                this.dataForm.createBy = data.notice.createBy
                this.dataForm.updateBy = data.notice.updateBy
                this.dataForm.createTime = data.notice.createTime
                this.dataForm.updateTime = data.notice.updateTime
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/exam/notice/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'title': this.dataForm.title,
                'content': this.dataForm.content,
                'description': this.dataForm.description,
                'isDeleted': this.dataForm.isDeleted,
                'createBy': this.dataForm.createBy,
                'updateBy': this.dataForm.updateBy,
                'createTime': this.dataForm.createTime,
                'updateTime': this.dataForm.updateTime
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
