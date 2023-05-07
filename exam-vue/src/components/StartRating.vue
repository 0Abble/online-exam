<template>
    <div class="start_rating_container">
      <span
        v-for="item of 5"
        :key="item"
        @click="startHandle(item)"
      >
        <i v-if="item <= value" class="iconfont icon-xingxing1"></i>
        <i v-else class="iconfont icon-xingxing"></i>
      </span>
    </div>
</template>
<script>
export default {
  props: {
    value: {
      type: Number,
      default: 0
    },
    disabled: {
      type: Boolean,
      default: false
    },
    size: {
        type: String,
        default: 'default'
    }
  },
  data() {
      return {

      }
  },
  methods: {
    startHandle(num) {
      if (!this.disabled) {
        this.$emit('input', num)
      }
    }
  }
}
</script>
<style lang="scss">
.start_rating_container{
  display: flex;
  align-items: center;
  span{
    display: flex;
    align-items: center;
  }
  .i{
    font-size: 20px;
    font-weight: bold;
  }
  .icon-xingxing1{
    color: #f2cb51;
  }
}
</style>
