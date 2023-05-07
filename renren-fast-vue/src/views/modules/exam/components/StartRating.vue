<template>
    <div class="start_rating_container">
      <span
        v-for="item of 5"
        :key="item"
        @click="startHandle(item)"
      >
        <icon-svg v-if="item <= value" name="startactive"></icon-svg>
        <icon-svg v-else name="start"></icon-svg>
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
  .icon-svg{
    font-size: 20px;
    font-weight: bold;
  }
}
</style>
