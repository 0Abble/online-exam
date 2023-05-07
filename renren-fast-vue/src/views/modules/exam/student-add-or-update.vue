<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" :inline="true" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="学号" prop="stuNo">
      <el-input v-model="dataForm.stuNo" placeholder="学号"></el-input>
    </el-form-item>
    <el-form-item label="姓名" prop="stuName">
      <el-input v-model="dataForm.stuName" placeholder="姓名"></el-input>
    </el-form-item>
    <!-- <el-form-item label="年级" prop="grade">
      <el-input v-model="dataForm.grade" placeholder="年级"></el-input>
    </el-form-item> -->

    <el-form-item label="班级" prop="clazz">
      <!-- <el-input v-model="dataForm.clazz" placeholder="班级"></el-input> -->
      <el-select v-model="dataForm.clazz" placeholder="请选择" style="width:  92%;">
          <el-option
            v-for="item in clazzList"
            :key="item.id"
            :label="item.className"
            :value="item.id+''">
          </el-option>
        </el-select>
    </el-form-item>
    <el-form-item label="学院" prop="institute">
      <el-input v-model="dataForm.institute" placeholder="学院"></el-input>
    </el-form-item>
    <el-form-item label="电话号码" prop="tel">
      <el-input v-model="dataForm.tel" placeholder="电话号码"></el-input>
    </el-form-item>
    <el-form-item label="专业" prop="major">
      <el-select v-model="dataForm.major" placeholder="请选择" style="width:  92%;">
          <el-option
            v-for="item in majotList"
            :key="item.id"
            :label="item.majorName"
            :value="item.id+''">
          </el-option>
        </el-select>
    </el-form-item>
    <el-form-item label="电子邮件" prop="email">
      <el-input v-model="dataForm.email" placeholder="电子邮件"></el-input>
    </el-form-item>
    <el-form-item label="密码" prop="pwd">
      <el-input v-model="dataForm.pwd" placeholder="密码"></el-input>
    </el-form-item>
    <el-form-item label="身份证号" prop="cardid">
      <el-input v-model="dataForm.cardid" placeholder="身份证号"></el-input>
    </el-form-item>
    <el-form-item label="性别" prop="sex">
      <el-input v-model="dataForm.sex" placeholder="性别"></el-input>
    </el-form-item>
    <el-form-item label="描述">
      <el-input v-model="dataForm.description" placeholder="描述"></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>

import {
  getAllMajor
} from '@/api/exam/major'
import {
  getAllClazz
} from '@/api/exam/clazz'

  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          stuNo: '',
          stuName: '',
          grade: '',
          major: '',
          clazz: '',
          institute: '',
          tel: '',
          email: '',
          pwd: '',
          cardid: '',
          sex: '',
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
          stuName: [
            { required: true, message: '姓名不能为空', trigger: 'blur' }
          ],
          grade: [
            { required: true, message: '年级不能为空', trigger: 'blur' }
          ],
          major: [
            { required: true, message: '专业不能为空', trigger: 'blur' }
          ],
          clazz: [
            { required: true, message: '班级不能为空', trigger: 'blur' }
          ],
          institute: [
            { required: true, message: '学院不能为空', trigger: 'blur' }
          ],
          tel: [
            { required: true, message: '电话号码不能为空', trigger: 'blur' }
          ],
          email: [
            { required: true, message: '电子邮件不能为空', trigger: 'blur' }
          ],
          pwd: [
            { required: true, message: '密码不能为空', trigger: 'blur' }
          ],
          cardid: [
            { required: true, message: '身份证号不能为空', trigger: 'blur' }
          ],
          sex: [
            { required: true, message: '性别不能为空', trigger: 'blur' }
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
        },
        majotList: [],
        clazzList: []
      }
    },
    created() {
      this.getAllMajor()
      this.getAllClazz()
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/exam/student/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.stuNo = data.student.stuNo
                this.dataForm.stuName = data.student.stuName
                this.dataForm.grade = data.student.grade
                this.dataForm.major = data.student.major
                this.dataForm.clazz = data.student.clazz
                this.dataForm.institute = data.student.institute
                this.dataForm.tel = data.student.tel
                this.dataForm.email = data.student.email
                this.dataForm.pwd = data.student.pwd
                this.dataForm.cardid = data.student.cardid
                this.dataForm.sex = data.student.sex
                this.dataForm.description = data.student.description
                this.dataForm.isDeleted = data.student.isDeleted
                this.dataForm.createBy = data.student.createBy
                this.dataForm.updateBy = data.student.updateBy
                this.dataForm.createTime = data.student.createTime
                this.dataForm.updateTime = data.student.updateTime
              }
            })
          }
        })
      },
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
          console.log(res)
          if (res.code == 0) {
            this.clazzList = res.data
          } else {
            return this.$message.error(res.msg)
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/exam/student/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'stuNo': this.dataForm.stuNo,
                'stuName': this.dataForm.stuName,
                'grade': this.dataForm.grade,
                'major': this.dataForm.major,
                'clazz': this.dataForm.clazz,
                'institute': this.dataForm.institute,
                'tel': this.dataForm.tel,
                'email': this.dataForm.email,
                'pwd': this.dataForm.pwd,
                'cardid': this.dataForm.cardid,
                'sex': this.dataForm.sex,
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
