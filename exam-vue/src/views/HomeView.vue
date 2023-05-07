<template>
  <div class="home">
    <!-- <el-carousel trigger="click" height="400px" direction="vertical">
      <el-carousel-item v-for="item in 4" :key="item">
        <h3 class="small">欢迎进入</h3>
      </el-carousel-item>
    </el-carousel> -->
    <div class="home_container">
      <div class="area_wrap">
        <div class="area_tip">通知公告</div>
        <div class="placeholder_wrap"></div>
        <div v-if="noticeList.length > 0" class="notice_list_wrap">
          <div
            v-for="notice of noticeList"
            :key="notice.id" 
            class="item_wrap"
            @click="showDetailHandle(notice)">
            {{ notice.title }}
          </div>
        </div>
        <NonDataWrap v-else />
      </div>
      <div class="area_wrap" style="margin-bottom: 60px">
        <div class="area_tip">师资团队</div>
        <div class="placeholder_wrap"></div>
        <div v-if="teacherList.length > 0" class="list_wrap">
          <div class="item_wrap" v-for="teacher of teacherList" :key="teacher.id">
            <div class="item" >
              <div class="head-img">
                <img :src="drawHeadImg(teacher.realName.charAt(0))" />
              </div>
              <p>{{ teacher.realName }}</p>
            </div>
          </div>
        </div>
        <NonDataWrap v-else />
      </div>
    </div>

    <el-dialog
      :title="dialogTitle"
      :visible.sync="dialogVisible"
      width="50%"
      :before-close="handleClose">
      <div class="notice_wrap" v-html="noticeContent"></div>
      <span slot="footer" class="dialog-footer">
        <!-- <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogVisible = false">确 定</el-button> -->
      </span>
    </el-dialog>
  </div>
</template>

<script>
import {
  getTeacherList
} from '@/api/user'

import {
  getNoticeList
} from '@/api/notice'

import NonDataWrap from '@/components/NonDataWrap.vue';
export default {
  name: 'HomeView',
  components: {
    NonDataWrap,
  },
  data() {
    return {
      teacherList: [],
      noticeList: [],
      noticeContent: '',
      dialogTitle: '',
      dialogVisible: false
    }
  },
  created() {
    this.getTeacherList()
    this.getNoticeList()
  }, 
  methods: {  
    getTeacherList() {
      getTeacherList().then(res => {
        if (res.code == 0) {
          this.teacherList = res.data
        } else {
          return this.$message.error(res.msg)
        }
      })
    },
    getNoticeList() {
      getNoticeList().then(res => {
        if (res.code == 0 ) {
          this.noticeList = res.data
        } else {
          return this.$message.error(res.msg)
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
    handleClose() {
      this.dialogTitle = ''
      this.noticeContent = ''
      this.dialogVisible = false
    },
    showDetailHandle(notice) {
      this.dialogTitle = notice.title
      this.noticeContent = notice.content
      this.dialogVisible = true
    }
  }
}
</script>
<style lang="scss">

.home{
  .el-carousel__item{
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .el-carousel__item h3 {
    color: #475669;
    font-size: 30px;
    opacity: 0.75;
  }

  .el-carousel__item:nth-child(2n) {
     background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
     background-color: #d3dce6;
  }

  .home_container{
    .area_wrap{
      .area_tip{
        position: relative;
        top: 10px;
        left: -40px;
        z-index: 100;
        background: #00cec9;
        color: #fff;
        font-weight: bold;
        display: inline-block;
        border-radius: 5px;
        padding: 10px 20px;
        
      }
      .placeholder_wrap{
        padding: 20px;
      }
      .list_wrap{
        box-sizing: border-box;
        width: 705px;
        margin: 0 auto;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: center;
        .item_wrap{
          width: 60px;
          box-sizing: border-box;
          margin: 10px 5px 10px 5px;
          .item{
            .head-img{
              border: 1px solid #ccc;
              box-sizing: border-box;
              height: 60px;
              width: 60px;
              border-radius: 50%;
              overflow: hidden;
              display: flex;
              align-items: center;
              justify-items: center;
            }
            &>p{
              text-align: center;
              font-size: 14px;
              color: #475669;
              padding-top: 5px;
            }
          }
        }
      }
      .notice_list_wrap{
        .item_wrap{
          font-size: 16px;
          font-weight: bold;
          border: 1px solid #eee;
          padding: 10px;
          border-radius: 5px;
          margin-bottom: 10px;
          cursor: pointer;
          &:hover{
            color: #00cec9;
          }
        }
      }
    }
  }
}
</style>