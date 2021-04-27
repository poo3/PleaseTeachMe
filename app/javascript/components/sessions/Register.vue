<template>
  <div class="register-wrapper">
    <h1>新規登録</h1>
    <div class="usertype-link-wrapper">
      <div class="teacher-link-wrapper">
        <router-link to="/teachers/new">
          <div class="teacher-link">先生はこちら</div>
        </router-link>
      </div>
      <div class="student-link-wrapper">
        <router-link to="/students/new">
          <div class="student-link">生徒はこちら</div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import "PleaseTeachMe-background-home.png";
export default {};
</script>

<style lang="scss" scoped>
.register-wrapper {
  background-image: url("~PleaseTeachMe-background-home.png");
  padding-top: 5rem;
  height: 80vh;
  width: 100%;
  > h1 {
    margin: 0;
    font-size: 3rem;
    color: whitesmoke;
  }
  > .usertype-link-wrapper {
    height: 60vh;
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
}
</style>