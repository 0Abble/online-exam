<template>
    <div class="forget-container">
        <el-card>
            <el-page-header @back="goBack" content="忘记密码"></el-page-header>
            <div class="forget-steps-wrap">
                <el-steps :active="stepIndex" simple>
                    <el-step title="验证手机" icon="el-icon-edit"></el-step>
                    <el-step title="设置密码" icon="el-icon-upload"></el-step>
                </el-steps>
            </div>
            <div class="forget-form-wrap">
                <el-form ref="form" v-if="stepIndex==1" label-width="100px">
                    <el-row>
                        <el-col :span="18">
                            <el-form-item label="手机号码">
                                <el-input placeholder="请输入手机号码"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row :gutter="10">
                        <el-col :span="18">
                            <el-form-item label="验证码">
                                <el-input placeholder="请输入验证码"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="6">
                            <el-button 
                                :type="isSendAuthCode?'':'primary'" 
                                @click="sendAuthCodeHandle"
                                :disabled="isSendAuthCode"
                            >{{isSendAuthCode?countdown:'获取验证码'}}</el-button>
                        </el-col>
                    </el-row>
                </el-form>
                <el-form 
                    v-if="stepIndex == 2" 
                    label-width="100px"
                    v-model="userForm"
                    :rules="userformRules">
                    <p class="form-tip">至少8个字符，至少1个大写字母，1个小写字母和1个数字,不能包含特殊字符</p>
                    <el-form-item label="新密码" prop="newPassword">
                        <el-input
                            prefix-icon="el-icon-lock"
                            minlength="8" 
                            v-model="userForm.newPassword"
                            placeholder="请输入新密码" show-password></el-input>
                    </el-form-item>
                    <el-form-item label="确认密码">
                        <el-input 
                            prefix-icon="el-icon-lock" 
                            minlength="8"
                            placeholder="请确认新密码" show-password></el-input>
                    </el-form-item>
                </el-form>
            </div>
            <div class="forget-btn-wrap">
                <el-button 
                    type="primary"
                    @click="nextStepHandle"
                >{{stepIndex==1?'下一步':'完成'}}</el-button>
            </div>
        </el-card>
    </div>
</template>
<script>
export default {
    data() {
        // 密码的验证规则
        var checkPassword = (rule, value, callback) => {
            const regPassword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/
            if (regPassword.test(value)) {
                // 合法邮箱
                return callback()
            }
            callback(new Error('请按规则填写'))
        }
        return {
            stepIndex: 1,
            isSendAuthCode: false,
            countdown: 60,
            userForm: {
                newPassword: ''
            },
            userformRules: {
                newPassword: [
                    // { required: true, message: '请按规则填写', trigger: 'blur' },
                    { validator: checkPassword, trigger: 'blur' }
                ]
            }
        }
    },
    methods: {
        goBack() {
            if(this.$router.history){
                if (window.history.length <= 1) {
                    this.$router.push({path:'/'})
                    return false
                } else {    
                    this.$router.go(-1)
                }
            }
        },
        sendAuthCodeHandle() {
            this.isSendAuthCode = true
            var timer = setInterval(() => {
                if(this.countdown == 0){
                    this.isSendAuthCode = false
                    return clearInterval(timer)
                }
                this.countdown--
            }, 1000)
        },
        nextStepHandle() {
            if(this.stepIndex == 1){
                this.stepIndex++
            }
        }
    }
}
</script>
<style lang="scss">
.forget-container{
    width: 100vw;
    height: 100vh;
    position: relative;
    .el-card{
        width: 1200px;
        position: relative;
        top: 30%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding-bottom: 30px;
    }
    .forget-steps-wrap{
        width: 100%;
        display: flex;
        justify-content: center;
        margin-top: 30px;
        .el-steps{
            width: 50%;
            height: 40px;
            .el-step__head{
                display: flex;
                align-items: center;
                justify-content: center;   
            }
        }
    }
    .forget-form-wrap{
        display: flex;
        justify-content: center;
        text-align: center;
        .el-form{
            width: 50%;
            padding: 30px 30px 0 0;
            .form-tip{
                font-size: 14px;
                text-align: center;
                color: rgb(161, 153, 153);
                margin-bottom: 20px;
            }
        }
    }
    .forget-btn-wrap{
        text-align: center;
        margin-top: 10px;
        .el-button{
            width: 45%;
        }
    }
}
</style>