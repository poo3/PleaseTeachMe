<template>
  <div class="student-login-form-wraper">
    <page-title :pageTitle="pageTitle" :textColor="black"></page-title>
    <users-login-form :user_type="user_type"></users-login-form>
  </div>
</template>

<script>
import PageTitle from "../PageTitle.vue";
import UsersLoginForm from "../_users/UsersLoginForm";
export default {
  components: { UsersLoginForm, PageTitle },
  data() {
    return { user_type: "student", pageTitle: "生徒ログイン", black: "black" };
  },
};
</script>

<style lang="scss" scoped>
</style>