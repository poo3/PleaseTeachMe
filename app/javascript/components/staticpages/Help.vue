<template>
  <div class="helpwrapper">
    <h1>Q＆A</h1>
    <v-expansion-panels>
      <v-expansion-panel v-for="(item, i) in 5" :key="i">
        <v-expansion-panel-header>{{
          listQuestionArray[i]
        }}</v-expansion-panel-header>
        <v-expansion-panel-content>
          {{ listAnswerArray[i] }}</v-expansion-panel-content
        >
      </v-expansion-panel>
    </v-expansion-panels>
  </div>
</template>

<script>
export default {
  data() {
    return {
      listQuestionArray: [
        "Q1の質問です",
        "Q2の質問です",
        "Q3の質問です",
        "Q4の質問です",
        "Q5の質問です",
      ],
      listAnswerArray: ["1111", "2222", "3333", "4444", "5555"],
    };
  },
};
</script>