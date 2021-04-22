<template>
  <div @click="usermenuClose">
    <Header ref="header"></Header>
    <router-view></router-view>
    <Footer></Footer>
  </div>
</template>

<script>
import Header from "components/Header";
import Footer from "components/Footer";
export default {
  data: function () {
    return {
      message: "Hello Vue!",
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
        //ここに外側をクリックしたときの処理
        if (this.$refs.header.usermenuActivated) {
          this.$refs.header.usermenuToggle();
        } else {
          this.$refs.header.usermenuToggle();
        }
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
</style>
