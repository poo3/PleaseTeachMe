<template>
  <div class="page-title">
    <h1 :style="textStyleObject">{{ pageTitle }}</h1>
  </div>
</template>

<script>
export default {
  props: ["pageTitle", "textColor"],
  data() {
    return {
      textStyleObject: {
        color: this.textColor,
      },
    };
  },
};
</script>

<style scoped>
h1 {
  font-size: 3rem;
}
</style>