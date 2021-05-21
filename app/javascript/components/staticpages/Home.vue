<template>
  <div class="home-wrapper">
    <div class="page-title-wrapper">
      <page-title :pageTitle="pageTitle" :textColor="appColor"></page-title>
    </div>
    <div class="introduction-app">
      <h1>リモート自習塾<br />好きな時に先生に質問</h1>
    </div>
  </div>
</template>

<script>
import "PleaseTeachMe-background-home.png";
import PageTitle from "../PageTitle.vue";
export default {
  components: { PageTitle },
  data() {
    return {
      pageTitle: "WELCOME TO PLEASE TEACH ME!!",
      appColor: "#880016",
    };
  },
};
</script>

<style lang="scss" scoped>
.home-wrapper {
  background-image: url("~PleaseTeachMe-background-home.png");
  background-repeat: no-repeat;
  width: 100%;
  margin: auto;
  height: 80vh;
  width: 100%;
  > .introduction-app {
    margin-top: 15rem;
    line-height: 6rem;
    font-size: 2rem;
    color: whitesmoke;
  }
}
</style>