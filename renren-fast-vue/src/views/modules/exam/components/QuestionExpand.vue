<template>
  <div class="question_expand_container">
    <p class="question_title">题目：{{ question.questionTitle }}</p>
    <div v-if="question.questionTypeId == '1' || question.questionTypeId == '2'" class="single_choice_wrap mult_choice_wrap">
      <div
        class="choice_item"
        v-for="(item, index) of question.content.split(splitChar)"
        :key="item"
      >
        <p  class="choice" :class="question.answer.split(splitChar).indexOf(item) > -1 ? 'answer_choice':''">{{ String.fromCharCode((97 + index)+'').toUpperCase() }}</p>
        <span>{{ item }}</span>
      </div>
    </div>
    <div v-else-if="question.questionTypeId == '3'" class="gap_fill_wrap">
      <p class="answer_title">答案</p>
      <span v-for="item of question.answer.split(splitChar)" :key="item">{{ item }}</span>
    </div>
    <div v-else-if="question.questionTypeId == '4'" class="judge_choice_wrap">
      <p class="answer_title">答案</p>
      <i :class="question.answer ? 'el-icon-check':'el-icon-close'"></i>
    </div>
    <div v-else class="short_answer_wrap">
      <p class="answer_title">答案</p>
      <div>{{ question.answer }}</div>
    </div>
    <div class="start_rating_wrap">
      <span>题目难度</span>
      <StartRating v-model="question.difficulty" :disabled="true"/>
    </div>
    <div class="question_analyse_wrap">
      <p>问题解析</p>
      <div>{{ question.analyse }}</div>
    </div>
  </div>
</template>
<script>
import StartRating from './StartRating.vue'
export default {
  props: ['question'],
  components: {
    StartRating
  },
  data() {
    return {
      splitChar: '∧'
    }
  },
}
</script>
<style lang="scss">
.question_expand_container{
  p{
    margin: 0;
  }
  .question_title{
    background: #eee;
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 20px;
  }
 .single_choice_wrap,
 .mult_choice_wrap{
   padding-left: 30px;
  .choice_item{
    display: flex;
    align-items: center;
    padding-bottom: 15px;
    .choice{
      padding: 5px 8px;
      border-radius: 5px;
      border: 1px solid #909399;
      font-size: 13px;
    }
    .answer_choice{
      background: #67C23A;
      color: #fff;
    }
    &>span{
      font-size: 13px;
      padding-left: 10px;
    }
  }
 }
 .gap_fill_wrap{
  display: flex;
  align-items: center;
  &>span{
    font-size: 12px;
    border-bottom: 1px solid #ccc;
    padding:0 10px;
    margin-left: 10px;
  }
 }
 .judge_choice_wrap{
  display: flex;
  align-items: center;
  &>i{
    padding: 0 10px;
  }
 }
 .answer_title{
  display: inline-block;
    background: #67C23A;
    padding: 5px 10px;
    border-radius: 5px;
    color: #fff;
  }
  .short_answer_wrap{
    &>div{
      border: 1px solid #ccc;
      padding: 10px;
      margin-top: 10px;
      // margin-left: 30px;
      font-size: 13px;
      border-radius: 5px;
    }
  }

 .question_analyse_wrap{
  padding-top: 20px;
  &>p{
    padding-bottom: 10px;
  }
  &>div{
    background: #eee;
    font-size: 13px;
    padding: 10px;
    border-radius: 5px;
  }
 }
 .start_rating_wrap{
  display: flex;
  align-items: center;
  &>span{
    padding-right: 5px;
  }
 }
}
</style>
