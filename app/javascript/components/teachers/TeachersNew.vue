<template>
  <div class="teacher-user-form-wrapper">
    <h1>先生登録</h1>
    <users-register-form :user_type="user_type"></users-register-form>
  </div>
</template>

<script>
import UsersRegisterForm from "../_users/UsersRegisterForm.vue";
export default {
  components: { UsersRegisterForm },
  data() {
    return { user_type: "teacher" };
  },
};
</script>

<style lang="scss" scoped>
</style>