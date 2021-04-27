<template>
  <div class="message" v-show="flashMessage">
    {{ flashMessage }}
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: "",
    };
  },

  computed: {
    //メッセージストアのステートにセットされてある「メッセージ内容」を返す
    flashMessage() {
      return this.$store.state.flashMessage;
    },
  },
};
</script>

<style scoped>
.message {
  text-align: center;
  color: red;
  font-size: 1.5rem;
}
</style>