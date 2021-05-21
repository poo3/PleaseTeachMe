<template>
  <div class="teacher-login-form-wraper">
    <page-title :pageTitle="pageTitle" :textColor="black"></page-title>
    <users-login-form :user_type="user_type"></users-login-form>
  </div>
</template>

<script>
import UsersLoginForm from "../_users/UsersLoginForm";
import PageTitle from "../PageTitle";
export default {
  components: { UsersLoginForm, PageTitle },
  data() {
    return { user_type: "teacher", pageTitle: "先生ログイン", black: "black" };
  },
};
</script>

<style lang="scss" scoped>
</style>