<template>
  <div @click="usermenuClose">
    <Header ref="header"></Header>
    <div class="flash-message" v-if="message != ``">
      {{ message }}
    </div>
    <router-view @catchMessage="updateMessage"></router-view>
    <Footer></Footer>
  </div>
</template>

<script>
import Header from "components/Header";
import Footer from "components/Footer";
export default {
  data: function () {
    return {
      message: "",
    };
  },
  components: {
    Header,
    Footer,
  },
  methods: {
    // usermenuToggle
    usermenuClose(element) {
      if (element.target.className !== "nav-usermenu") {
        //ここにusermenu以外をクリックしたときの処理
        if (this.$refs.header.usermenuActivated) {
          this.$refs.header.usermenuToggle();
        }
      } else {
        this.$refs.header.usermenuToggle();
      }
    },
    updateMessage(message) {
      this.message = message;
      setTimeout(() => {
        this.message = "";
      }, 5000);
    },
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.flash-message {
  text-align: center;
  color: red;
}
</style>
