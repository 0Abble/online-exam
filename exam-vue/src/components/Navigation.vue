<template>
    <div class="nav-wrap">
      <div class="logo-wrap">
        <img :src="require('@/assets/logo.png')" alt="">
      </div>
      <div class="nav-item-wrap">
          <p
            v-for="item of navList"
            :key="item.name"
            class="nav-item"
            :class="{'nav_activate':item.activate}"
            @click="nacClickHandle(item)"
          >
            {{ item.name }}
          </p>
      </div>
      <div class="head-img-wrap">
        <el-dropdown>
          <div class="head-img">
            <img :src="drawHeadImg(user.stuName.charAt(0))" />
          </div>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item >
              <p>管理中心</p>
            </el-dropdown-item>
            <el-dropdown-item>
              <p class="exit" @click="exit()">退出</p>
            </el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
</template>

<script>
import {
  getUserInfo
} from '@/api/user'
import { 
  removeToken
} from '@/util/auth'
import { mapState,mapMutations } from 'vuex'
export default {
  data() {
    return {
      user: {
        stuName: '李大爷'
      },
      navList: [
        {
          name: '首页',
          activate: true,
          navigation: '/'
        },{
          name: '我的试卷',
          activate: false,
          navigation: '/mine'
        },{
          name: '考试记录',
          activate: false,
          navigation: '/record'
        }, {
          name: '自由练习',
          activate: false,
          navigation: '/practice'
        }
      ]
    }
  },
  created() {
    this.getUserInfo()
  },
  mounted() {
    let nav = window.localStorage.getItem('navItem') || ''
    if (nav) {
      this.navList.forEach(item => {
        item.activate = false
        if (item.navigation == nav) {
          item.activate = true
        }
      })
    }
  }, 
  methods: {
    ...mapMutations(['SET_USER']),
    getUserInfo() {
      getUserInfo().then(res => {
        if (res.code == 0) {
          this.user = res.data
          this.SET_USER(res.data)
        }
      })
    },
    // 将字符串变为文字
    drawHeadImg(text) {
        // 创建画布
        let canvas = document.createElement('canvas');
        // 绘制文字环境
        let context = canvas.getContext('2d');
        // 画布宽度
        canvas.width = 64;
        // 画布高度
        canvas.height = 64;
        // 填充白色
        context.fillStyle = '#ffffff';
        // 绘制文字之前填充白色
        context.fillRect(0, 0, canvas.width, canvas.height);
        // 设置字体
        context.font = "bold 25px 微软雅黑";
        // 设置水平对齐方式
        context.textAlign = 'center';
        // 设置垂直对齐方式
        context.textBaseline = 'middle';
        // 设置字体颜色
        context.fillStyle = '#000000';

        // 绘制文字(参数：要写的字，x坐标，y坐标)
        context.fillText(text, canvas.width / 2, canvas.height / 2);
        // 生成图片信息
        let dataUrl = canvas.toDataURL('image/png');
        return dataUrl;
    },
    nacClickHandle(item) {
      window.localStorage.setItem('navItem', item.navigation)
      this.navList.forEach(item => {
        item.activate = false
      })
      item.activate = true
      this.$router.push(item.navigation)
    },
    // 点击退出
    exit() {
      removeToken()
      this.$router.push('/login')
    }
  }
}
</script>
<style lang="scss">
.nav-wrap{
    box-shadow: 0 0 10px 4px rgba(1,149,255,0.1);
    background-color: #fff;
    display: flex;
    align-items: center;
    height: 60px;
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    z-index: 100;
    .logo-wrap{
        width: 20%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: right;
        padding: 5px;
        img{
            // height: 60px;
            width: 150px;
        } 
    }
    .nav-item-wrap{
    width: 70%;
    display: flex;
    align-items: center;
    height: 100%;
    // padding: 0 30px;
    .nav-item{
        display: flex;
        align-items: center;
        padding: 10px;
        margin: 0 5px;
        cursor: pointer;
        font-size: 15px;
        font-family: Arial, Helvetica, sans-serif;
        a{
        text-decoration: none;
        color: #334046;
        }
        &:hover {
          background-color: #dfe6e9;
          border-radius: 5px;
        }
    }
    .nav_activate{
      background-color: #dfe6e9;
      border-radius: 5px;
    }
  }
    .head-img-wrap{
    width: 10%;
    display: flex;
    align-items: center;
    .head-img{
        border: 1px solid #ccc;
        border-radius: 5px;
        height: 40px;
        width: 40px;
        overflow: hidden;
    }
    .el-dropdown-item{
        border: 1px solid red;
    }
    }
}
</style>