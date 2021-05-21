<template>
  <div class="student-user-form-wrapper">
    <page-title :pageTitle="pageTitle" :textColor="black"></page-title>
    <users-register-form :user_type="user_type"></users-register-form>
  </div>
</template>

<script>
import PageTitle from "../PageTitle.vue";
import UsersRegisterForm from "../_users/UsersRegisterForm.vue";
export default {
  components: { UsersRegisterForm, PageTitle },
  data() {
    return { user_type: "student", pageTitle: "生徒登録", textColor: "black" };
  },
};
</script>

<style lang="scss" scoped>
</style>