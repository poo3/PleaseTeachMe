<template>
  <div class="user-profile">
    <h1>Students Show Page!!</h1>
    <h3>{{ user.user_type }}ユーザです</h3>
    <h3>名前：{{ user.name }}</h3>
  </div>
</template>

<script>
import axios from "axios";
axios.defaults.headers.common = {
  "X-Requested-With": "XMLHttpRequest",
  "X-CSRF-TOKEN": document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute("content"),
};
export default {
  data() {
    return {
      user: {},
    };
  },
  mounted() {
    axios
      .get(`/users/${this.$route.params.id}`)
      .then((response) => {
        console.log(response);
        if (response.data.current_user) {
          this.user = response.data.user;
        } else {
          this.$emit("catchMessage", response.data.message);
          this.$router.push({
            name: "entrance_path",
            params: { message: response.data.message },
          });
        }
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>