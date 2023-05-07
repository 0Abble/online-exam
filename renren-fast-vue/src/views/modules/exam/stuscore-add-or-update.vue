<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="学号" prop="stuNo">
      <el-input v-model="dataForm.stuNo" placeholder="学号"></el-input>
    </el-form-item>
    <el-form-item label="试卷id" prop="paperId">
      <el-input v-model="dataForm.paperId" placeholder="试卷id"></el-input>
    </el-form-item>
    <el-form-item label="得分" prop="score">
      <el-input v-model="dataForm.score" placeholder="得分"></el-input>
    </el-form-item>
    <el-form-item label="描述" prop="description">
      <el-input v-model="dataForm.description" placeholder="描述"></el-input>
    </el-form-item>
    <el-form-item label="逻辑删除0未删除1以删除" prop="isDeleted">
      <el-input v-model="dataForm.isDeleted" placeholder="逻辑删除0未删除1以删除"></el-input>
    </el-form-item>
    <el-form-item label="创建人" prop="createBy">
      <el-input v-model="dataForm.createBy" placeholder="创建人"></el-input>
    </el-form-item>
    <el-form-item label="修改人" prop="updateBy">
      <el-input v-model="dataForm.updateBy" placeholder="修改人"></el-input>
    </el-form-item>
    <el-form-item label="创建时间" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="创建时间"></el-input>
    </el-form-item>
    <el-form-item label="修改时间" prop="updateTime">
      <el-input v-model="dataForm.updateTime" placeholder="修改时间"></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          stuNo: '',
          paperId: '',
          score: '',
          description: '',
          isDeleted: '',
          createBy: '',
          updateBy: '',
          createTime: '',
          updateTime: ''
        },
        dataRule: {
          stuNo: [
            { required: true, message: '学号不能为空', trigger: 'blur' }
          ],
          paperId: [
            { required: true, message: '试卷id不能为空', trigger: 'blur' }
          ],
          score: [
            { required: true, message: '得分不能为空', trigger: 'blur' }
          ],
          description: [
            { required: true, message: '描述不能为空', trigger: 'blur' }
          ],
          isDeleted: [
            { required: true, message: '逻辑删除0未删除1以删除不能为空', trigger: 'blur' }
          ],
          createBy: [
            { required: true, message: '创建人不能为空', trigger: 'blur' }
          ],
          updateBy: [
            { required: true, message: '修改人不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '修改时间不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/exam/stuscore/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.stuNo = data.stuScore.stuNo
                this.dataForm.paperId = data.stuScore.paperId
                this.dataForm.score = data.stuScore.score
                this.dataForm.description = data.stuScore.description
                this.dataForm.isDeleted = data.stuScore.isDeleted
                this.dataForm.createBy = data.stuScore.createBy
                this.dataForm.updateBy = data.stuScore.updateBy
                this.dataForm.createTime = data.stuScore.createTime
                this.dataForm.updateTime = data.stuScore.updateTime
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
              url: this.$http.adornUrl(`/exam/stuscore/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'stuNo': this.dataForm.stuNo,
                'paperId': this.dataForm.paperId,
                'score': this.dataForm.score,
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
