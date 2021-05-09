<template>
  <div>
    <h1>登録内容変更</h1>
    <users-edit-form :user_type="user_type"></users-edit-form>
  </div>
</template>

<script>
import UsersEditForm from "../_users/UsersEditForm.vue";
export default {
  data() {
    return {
      user_type: "teacher",
    };
  },
  components: { UsersEditForm },
};
</script>
    UsersEditForm