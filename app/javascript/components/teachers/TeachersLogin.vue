<template>
  <div class="teacher-login-form-wraper">
    <h1>先生ログイン</h1>
    <users-login-form :user_type="user_type"></users-login-form>
  </div>
</template>

<script>
import UsersLoginForm from "../_users/UsersLoginForm";
export default {
  components: { UsersLoginForm },
  data() {
    return { user_type: "teacher" };
  },
};
</script>

<style lang="scss" scoped>
</style>