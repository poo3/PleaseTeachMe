<template>
  <div @click="usermenuClose">
    <Header ref="header"></Header>
    <Message></Message>
    <router-view></router-view>
    <Footer></Footer>
  </div>
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
p {
  font-size: 2em;
  text-align: center;
}
.flash-message {
  text-align: center;
  color: red;
}
</style>
