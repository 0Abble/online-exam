<template>
    <div class="app_container">
        <navigation/>
        <div class="main-container">
            <el-scrollbar style="height: 100%">
                <div class="main-wrap">
                <router-view/>
                </div>
            </el-scrollbar>
            <Footer/>
        </div>
    </div>
</template>
<script>
import Navigation from '@/components/Navigation.vue'
import Footer from '@/components/Footer.vue'
export default {
  components: {
    Navigation,
    Footer
  }
}
</script>
<style lang="scss">
.app_container{
    .main-container{
    margin-top: 60px;
    // min-height: calc(100vh - 60px);
    background-image: url('../assets/img/concrete-texture.png');
    .el-scrollbar .el-scrollbar__wrap{
      overflow-x: hidden;
    }
    .main-wrap{
      margin: 0 auto;
      // margin-top: 30px;
      min-height: calc(100vh - 160px);
    }
  }
}
</style>