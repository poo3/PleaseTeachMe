<template>
  <v-app id="app" @click="usermenuClose">
    <Header ref="header"></Header>
    <Message></Message>
    <router-view id="main-contents"></router-view>
    <Footer></Footer>
  </v-app>
</template>

<script>
import Header from "components/Header";
import Footer from "components/Footer";
import Message from "components/Message";
export default {
  data: function () {
    return {
      message: "",
    };
  },
  components: {
    Header,
    Footer,
    Message,
  },
  methods: {
    // usermenuToggle
    usermenuClose(element) {
      console.log("click!");
      if (element.target.className !== "nav-usermenu") {
        //ここにusermenu以外をクリックしたときの処理
        if (this.$refs.header.usermenuActivated) {
          this.$refs.header.usermenuToggle();
        }
      } else {
        this.$refs.header.usermenuToggle();
      }
    },
  },
};
</script>

<style scoped>
#main-contents {
  margin-top: 15vh;
}
header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 15vh;
}
p {
  font-size: 2em;
  text-align: center;
}
.flash-message {
  text-align: center;
  color: red;
}
</style>
