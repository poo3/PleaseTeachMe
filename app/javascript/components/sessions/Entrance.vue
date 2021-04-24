<template>
  <div class="usertype-link-wrapper">
    <div class="teacher-link-wrapper">
      <router-link to="/">
        <div class="teacher-link">先生はこちら</div>
      </router-link>
    </div>
    <div class="student-link-wrapper">
      <router-link to="/">
        <div class="student-link">生徒はこちら</div>
      </router-link>
    </div>
  </div>
</template>

<script>
import "PleaseTeachMe-background-home.png";
export default {};
</script>

<style lang="scss" scoped>
.usertype-link-wrapper {
  background-image: url("~PleaseTeachMe-background-home.png");
  height: 80vh;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  > .teacher-link-wrapper {
    width: 50%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    > a {
      width: 40%;
      height: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      border: 1px solid gray;
      background-color: whitesmoke;
      text-align: center;
      border-radius: 5rem;
      text-decoration: none;
      font-size: 1.5rem;
      color: #880016;
    }
  }
  > .student-link-wrapper {
    width: 50%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    > a {
      width: 40%;
      height: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      border: 1px solid gray;
      background-color: whitesmoke;
      text-align: center;
      border-radius: 5rem;
      text-decoration: none;
      font-size: 1.5rem;
      color: #880016;
    }
  }
}
</style>