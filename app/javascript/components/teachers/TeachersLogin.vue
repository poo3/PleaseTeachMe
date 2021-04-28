<template>
  <div class="user-form-wrapper">
    <h1>先生ログインページ</h1>
    <div class="form-group">
      <label for="userEmail">メールアドレス</label>
      <input
        type="email"
        name="userEmail"
        v-model="session.email"
        class="form-control"
        id="userEmail"
        placeholder="メールアドレスを入力して下さい"
      />
    </div>
    <div class="form-group">
      <label for="userPassword">パスワード</label>
      <input
        type="password"
        name="userPassword"
        v-model="session.password"
        class="form-control"
        id="userPassword"
        placeholder="パスワードを入力して下さい"
      />
    </div>

    <div class="login-button-wrapper">
      <input
        @click="submitUser"
        type="submit"
        value="ログイン"
        name="loginBtn"
        class="btn btn-login"
        id="loginBtn"
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
      error: false,
      session: {
        email: "",
        password: "",
      },
    };
  },
  methods: {
    submitUser() {
      axios
        .post("/login", this.session)
        .then((response) => {
          console.log(response);
          const loggedinUser = response.data.user;
          this.$store.dispatch("catchMessage", {
            message: response.data.message,
            timeout: 5000,
          });
          this.$store.dispatch("changeLogin");
          this.$router.push({
            name: "teachers_user_show_path",
            params: { id: loggedinUser.id },
          });
        })
        .catch((error) => {
          console.log(error);
          this.$store.dispatch("catchMessage", {
            message: error.response.data.message,
            timeout: 5000,
          });
        });
    },
  },
};
</script>

<style lang="scss" scoped>
.user-form-wrapper {
  > .error {
    margin: 3rem 0;
    color: red;
    text-align: center;
  }
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
  > .login-button-wrapper {
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