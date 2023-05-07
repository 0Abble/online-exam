<template>
    <div class="login-container">
        <!-- 登录表单部分 -->
        <div class="form-wrap">
            <!-- <transition
                name="custom-classes-transition"
                enter-active-class="animated fadeInDown"
                leave-active-class="animated bounceOut">
                <div class="logo-wrap" v-if="showLogin">
                    <el-image :src="require('@/assets/logo.png')"></el-image>
                </div>
            </transition> -->
            <div class="transition-wrap">
                <transition 
                name="custom-classes-transition"
                enter-active-class="animated fadeInUp"
                leave-active-class="animated bounceOut">
                    <div class="login-form-wrap">
                        <h2>登录</h2>
                        <el-form class="loginForm" ref="loginForm" :model="loginForm">
                            <el-input
                                clearable
                                placeholder="请输入账号"
                                prefix-icon="el-icon-user"
                                v-model="loginForm.account">
                            </el-input>
                            <el-input
                                placeholder="请输入密码"
                                prefix-icon="el-icon-lock"
                                v-model="loginForm.password"
                                show-password>
                            </el-input>
                        </el-form>
                        <div class="enrol-other">
                            <span 
                                @click="goto('forget')"
                            >忘记密码</span>
                            <!-- <span @click="goto('enroll')">新用户登录</span> -->
                        </div>
                        <div class="login-btn-wrap">
                            <el-button type="primary" @click="handleLogin">登录</el-button>
                        </div>
                    </div>
                </transition>
            </div>
        </div>
        <div class="login-bg-wrap">
            <el-image :src="require('@/assets/login_bg.png')"></el-image>
        </div>
    </div>
</template>
<script>

import {
    login
} from '@/api/login.js'

import { 
    setToken
} from '@/util/auth'

import { mapState,mapMutations } from 'vuex'
export default {
    data() {
        return {
            loginForm: {
                account: '',
                password: ''
            },
        }
    },
    computed: {
        ...mapState(['user'])
    },
    created() {
    },
    methods: {
        ...mapMutations(['SET_TOKEN']),
        goto(str) {
            this.$router.push('/'+str)
        },
        async handleLogin() {
            const res = await login(this.loginForm)
            if(res.code != 0) return this.$message.error(res.msg)
            setToken(res.token)
            this.$message.success('登录成功')
            this.$router.push('/')
        }
    }
}
</script>

<style lang="scss">

.el-scrollbar__wrap {  // 必要的
    overflow-x: hidden;
}
.login-container{
    width: 100%;
    height: 100vh;
    background: #fff;
    display: flex;
    .form-wrap{
        width: 45%;
        height: 100%;
        .logo-wrap{
            position: absolute;
            top: 10%;
            left: 13%;
            height: 117px;
            width: 320px;
            img{
                height: 100%;
                width: 100%;
            }
        }
        .transition-wrap{
            position: relative;
            top: 50%;
            left: 50%;
            transform: translate(-40%, -50%);
            width: 50%;
            .login-form-wrap{
                h2{
                    display: inline;
                    letter-spacing: 2px;
                    &::before{
                        content: '';
                        border: 2px solid #409EFF;
                        border-radius: 30%;
                        margin-right: 10px;
                    }
                }
                .loginForm{
                    margin-top: 20px;
                    .el-input{
                        margin-bottom: 25px;
                        .iconfont{
                            color: #409EFF;
                        }
                        .el-input__inner{
                            border-top: none;
                            border-left: none;
                            border-right: none;
                        }
                    }
                }
                .enrol-other{
                    color: #636e72;
                    font-size: 13px;
                    margin-bottom: 25px;
                    cursor: pointer;
                    span{
                        &:hover{
                            color: #409EFF;
                        }
                    }
                }
                .login-btn-wrap{
                    .el-button{
                        font-size: 16px;
                        padding: 10px 60px;
                    }
                }
            }
        }
    }
    .note-wrap{
        width: 55%;
        height: 100%;
        &>div{
            height: 98%;
            width: 90%;
        }
        .el-scrollbar{
            padding-top: 20px;
            .el-card{
                
                .vue-typed{
                }
            }
        }
    }
    .login-bg-wrap{
        width: 55%;
        .el-image{
            height: 99vh;
            display: flex;
            align-items: center;
        }
    }
}
</style>
