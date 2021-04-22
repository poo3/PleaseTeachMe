<template>
  <div class="introduction-app">
    <h1>リモート自習塾、<br />好きな時に先生に質問</h1>
  </div>
</template>

<script>
import "PleaseTeachMe-background-home.png";
export default {};
</script>

<style lang="scss" scoped>
.introduction-app {
  background-image: url("~PleaseTeachMe-background-home.png");
  background-repeat: no-repeat;
  width: 100%;
  margin: auto;
  height: 80vh;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  > h1 {
    color: whitesmoke;
    width: 100%;
  }
}
</style>