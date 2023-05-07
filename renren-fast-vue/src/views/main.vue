<template>
  <div
    class="site-wrapper"
    :class="{ 'site-sidebar--fold': sidebarFold }"
    v-loading.fullscreen.lock="loading"
    element-loading-text="拼命加载中">
    <template v-if="!loading">
      <main-navbar />
      <main-sidebar />
      <div class="site-content__wrapper" :style="{ 'min-height': documentClientHeight + 'px' }">
        <main-content v-if="!$store.state.common.contentIsNeedRefresh" />
      </div>
    </template>
  </div>
</template>

<script>
  import {
    noPassPaperList
  } from '@/api/exam/paper'

  import {
    updateAffirmByIds
  } from '@/api/exam/paper'

  import MainNavbar from './main-navbar'
  import MainSidebar from './main-sidebar'
  import MainContent from './main-content'
  import NotifyMsg from './components/NotifyMsg'
  export default {
    provide () {
      return {
        // 刷新
        refresh () {
          this.$store.commit('common/updateContentIsNeedRefresh', true)
          this.$nextTick(() => {
            this.$store.commit('common/updateContentIsNeedRefresh', false)
          })
        }
      }
    },
    data () {
      return {
        loading: true,
        notifyInfo: null,
      }
    },
    components: {
      MainNavbar,
      MainSidebar,
      MainContent,
      NotifyMsg
    },
    computed: {
      documentClientHeight: {
        get () { return this.$store.state.common.documentClientHeight },
        set (val) { this.$store.commit('common/updateDocumentClientHeight', val) }
      },
      sidebarFold: {
        get () { return this.$store.state.common.sidebarFold }
      },
      userId: {
        get () { return this.$store.state.user.id },
        set (val) { this.$store.commit('user/updateId', val) }
      },
      userName: {
        get () { return this.$store.state.user.name },
        set (val) { this.$store.commit('user/updateName', val) }
      }
    },
    created () {
      this.getUserInfo()
    },
    mounted () {
      this.resetDocumentClientHeight()
    },
    methods: {
      // 重置窗口可视高度
      resetDocumentClientHeight () {
        this.documentClientHeight = document.documentElement['clientHeight']
        window.onresize = () => {
          this.documentClientHeight = document.documentElement['clientHeight']
        }
      },
      // 获取当前管理员信息
      getUserInfo () {
        this.$http({
          url: this.$http.adornUrl('/sys/user/info'),
          method: 'get',
          params: this.$http.adornParams()
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.loading = false
            this.userId = data.user.userId
            this.userName = data.user.username

            this.getNoPassPaperList(data.user.workNo)
          }
        })
      },
      getNoPassPaperList(workNo) {
        let that = this
        noPassPaperList(workNo).then(res => {
          if (res.code == 0) {
            if (res.data.length > 0) {
              this.notifyInfo = this.$notify.info({
                title: '提示',
                dangerouslyUseHTMLString: true,
                duration: 0,
                message: this.$createElement('NotifyMsg', {
                  ref: 'notifyMsg',
                  props: {
                    msgList: res.data,
                  },
                }),
                onClose: function () {
                  that.updateAffirmByIds(res.data)
                }
              })
            }
          }
        })
      },
      updateAffirmByIds(list) {
        let ids = list.map(item => item.id)
        updateAffirmByIds(ids)
      }
    }
  }
</script>
