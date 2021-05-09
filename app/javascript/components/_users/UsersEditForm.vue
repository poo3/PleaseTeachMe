<template>
  <div class="user-form-wrapper">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li class="vlidate-message">
          {{ e }}
        </li>
      </ul>
    </div>
    <div class="form-group">
      <label for="userName">名前</label>
      <input
        type="text"
        name="userName"
        v-model="user.name"
        class="form-control"
        id="userName"
      />
    </div>
    <div class="form-group">
      <label for="userEmail">メールアドレス</label>
      <input
        type="email"
        name="userEmail"
        v-model="user.email"
        class="form-control"
        id="userEmail"
      />
    </div>
    <div class="form-group">
      <label for="userPassword">パスワード</label>
      <input
        type="password"
        name="userPassword"
        v-model="user.password"
        class="form-control"
        id="userPassword"
        placeholder="パスワードを入力して下さい"
      />
    </div>
    <div class="form-group">
      <label for="userPasswordConfirmation">パスワードの確認</label>
      <input
        type="password"
        name="userPasswordConfirmation"
        v-model="user.password_confirmation"
        class="form-control"
        id="userPasswordConfirmation"
        placeholder="再度パスワード入力して下さい"
      />
    </div>
    <div class="submit-button-wrapper">
      <input
        @click="updateUser"
        type="submit"
        value="更新"
        name="submitBtn"
        class="btn btn-submit"
        id="submitBtn"
      />
    </div>
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
      errors: "",
      user: {
        name: "",
        email: "",
        password: "",
        password_confirmation: "",
        user_type: this.user_type,
      },
    };
  },
  props: ["user_type"],
  mounted() {
    if (this.$store.state.userInfo.currentUser) {
      return (
        (this.user.name = this.$store.state.userInfo.currentUser.name),
        (this.user.email = this.$store.state.userInfo.currentUser.email)
      );
    }
  },
  methods: {
    updateUser() {
      axios
        .patch(`/api/users/${this.$route.params.id}`, {
          user: this.user,
        })
        .then((response) => {
          console.log(response);
          const updatedUser = response.data.user;
          console.log(updatedUser);
          this.$store.dispatch("flashMessage/catchMessage", {
            message: response.data.message,
            timeout: 5000,
          });
          this.$store.dispatch("userInfo/updateUser", updatedUser);
        })
        .catch((error) => {
          console.error(error);
          console.log(error.response);
          this.$store.dispatch("flashMessage/catchMessage", {
            message: error.response.data.message,
            timeout: 5000,
          });
        });
    },
  },
};
</script>

<style lang="scss" scoped>
.vlidate-message {
  color: red;
  text-align: center;
}
.user-form-wrapper {
  > .form-group {
    height: 2rem;
    width: 40%;
    margin: 2rem auto;
    position: relative;
    display: flex;
    align-items: center;
    > input {
      height: 100%;
      position: absolute;
      left: 15rem;
      width: 60%;
      border: 2px solid #880016;
      padding-left: 1rem;
      border-radius: 1rem;
      outline: 0;
    }
  }
  > .submit-button-wrapper {
    width: 40%;
    margin: 10vh auto;
    text-align: center;
    > input {
      margin: auto;
      border: 2px solid #880016;
      padding: 0.5rem;
      border-radius: 1rem;
      width: 6rem;
    }
  }
}
</style>