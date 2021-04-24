<template>
  <div class="user-profile">
    <h1>Teachers Show Page!!</h1>
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
        this.user = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>