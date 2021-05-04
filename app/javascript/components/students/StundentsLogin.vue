<template>
  <div class="student-login-form-wraper">
    <h1>生徒ログイン</h1>
    <users-login-form></users-login-form>
  </div>
</template>

<script>
import UsersLoginForm from "../_users/UsersLoginForm";
export default {
  components: { UsersLoginForm },
};
</script>

<style lang="scss" scoped>
</style>