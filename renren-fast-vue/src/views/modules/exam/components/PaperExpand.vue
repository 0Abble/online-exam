<template>
  <div class="paper_expand_container">
    <div v-if="paperInfo.isChecked == 1" class="allocation_paper_wrap">
      <el-tag
        :key="tag"
        v-for="tag in dynamicTags"
        closable
        :disable-transitions="false"
        @close="handleClose(tag)">
        <template v-for="item of clazzList">
          <span :key="item.id" v-if="tag == item.id">{{ item.className }}</span>
        </template>
      </el-tag>
      <!-- <el-input
        class="input-new-tag"
        v-if="inputVisible"
        v-model="inputValue"
        ref="saveTagInput"
        size="small"
        @keyup.enter.native="handleInputConfirm"
        @blur="handleInputConfirm"
      >
      </el-input> -->
      <el-select
        v-if="inputVisible"
        v-model="inputValue"
        placeholder="请选择"
        size="small"
        @change="selectClassChange">
        <el-option
          v-for="item in clazzList"
          :key="item.id"
          :label="item.className"
          :value="item.id"
          :disabled="item.isDisabled">
        </el-option>
      </el-select>
      <el-button v-else class="button-new-tag" size="small" @click="showInput">+ 分配班级</el-button>
    </div>
    <div v-if="paperInfo.isChecked == -1" class="check_info_wrap" >
      <p>审核信息</p>
      <div class="check_msg" v-html="paperInfo.checkMsg"></div>
    </div>
  </div>
</template>
<script>
import {
  getAllClazz
} from '@/api/exam/clazz'
import {
  savePaperClazzRelation,
  getPaperClazzRelationListByPaperId,
  deletePaperClazzRelation
} from '@/api/exam/paper'
export default {
  props: {
    paperInfo: {
      type: Object,
      default: {}
    },
  },
  data() {
    return {
      clazzList: [],

      dynamicTags: [],
      inputVisible: false,
      inputValue: '',

    }
  },
  created() {
    this.getPaperClazzRelationList()
  },
  methods: {
    getPaperClazzRelationList() {
      getPaperClazzRelationListByPaperId(this.paperInfo.id).then(res=>{
        if (res.code == 0) {
          let clazzIds = res.data.map(item => item.clazzId)
          this.dynamicTags = clazzIds
          this.getAllClazz()
        } else {
          return this.$message.error(res.msg)
        }
      })
    },
    getAllClazz() {
      getAllClazz().then(res => {
        if (res.code == 0) {
          this.clazzList = res.data
          this.clazzList.forEach(item => {
            let index = this.dynamicTags.findIndex(id => id == item.id)
            if (index > -1) {
              item.isDisabled = true
            } else item.isDisabled = false
          })
        } else {
          return this.$message.error(res.msg)
        }
      })
    },
    handleClose(tag) {
      this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1)
      deletePaperClazzRelation(this.paperInfo.id, tag).then(res => {
        this.getPaperClazzRelationList()
      })
    },

    showInput() {
      this.inputVisible = true;
      // this.$nextTick(_ => {
      //   this.$refs.saveTagInput.$refs.input.focus();
      // });
    },

    handleInputConfirm() {
      let inputValue = this.inputValue;
      if (inputValue) {
        this.dynamicTags.push(inputValue);
      }
      this.inputVisible = false;
      this.inputValue = '';
    },

    selectClassChange() {
      let inputValue = this.inputValue;
      if (inputValue) {
        this.dynamicTags.push(inputValue);
        savePaperClazzRelation(this.paperInfo.id, inputValue).then(res => {
          this.getPaperClazzRelationList()
        })
      }
      this.inputVisible = false;
      this.inputValue = null
    }
  }
}
</script>
<style lang="scss">
.paper_expand_container{
  .allocation_paper_wrap{
    .el-tag + .el-tag {
      margin-left: 10px;
    }
    .button-new-tag {
      margin-left: 10px;
      height: 32px;
      line-height: 30px;
      padding-top: 0;
      padding-bottom: 0;
    }
    .input-new-tag {
      width: 90px;
      margin-left: 10px;
      vertical-align: bottom;
    }
  }
  .check_info_wrap{
    &>p{
      background: #eee;
      padding: 10px;
      border-radius: 5px;
    }
    .check_msg{
      font-size: 13px;
      img{
        border: 1px solid #eee;
        margin: 0 10px;
      }
    }
  }
}
</style>
