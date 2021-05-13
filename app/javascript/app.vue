<template>
  <v-app id="app" @click="usermenuClose">
    <Header ref="header" id="header"></Header>
    <Message id="flash-message"></Message>
    <router-view id="main-contents"></router-view>
    <Footer id="footer"></Footer>
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
#flash-message {
  position: fixed;
  top: 15vh;
  width: 100%;
  background-color: whitesmoke;
}
#main-contents {
  padding-top: 3vh;
  margin-top: 15vh;
}
#header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 15vh;
  margin-bottom: 15vh;
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
