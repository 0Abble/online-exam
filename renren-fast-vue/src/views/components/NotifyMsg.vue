<template>
  <div class="notity_msg_container">
    <div
      v-for="item of msgList"
      :key="item.id"
      class="msg_item_wrap">
      <span class="prefix" :class="item.isChecked == -1 ? 'no_pass':'pass'">{{ item.isChecked == -1?'未通过':'通过' }}</span>
      <p>试卷名：<span>{{ item.paperTitle }}</span></p>
    </div>
  </div>
</template>
<script>

export default {
  props: {
    msgList: {
      type: Array,
      default: [],
    },
  },
  data() {
    return {
    }
  },
  created() {
  },
  mounted() {
  },
  methods: {
  }
}
</script>
<style lang="scss">
.notity_msg_container{
  padding-top: 10px;
  .msg_item_wrap{
    font-size: 12px;
    margin-bottom: 10px;
    .prefix{
      color: #fff;
      padding: 5px 10px;
      border-radius: 5px;
    }
    .no_pass{
      background: #F56C6C;
    }
    .pass{
      background: #67C23A;
    }
    &>P{
      margin-top: 5px;
    }
  }
  .btn_wrap{
    display: flex;
    align-items: center;
    justify-content: right;
  }
}
</style>
