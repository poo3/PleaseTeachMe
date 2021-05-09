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
        placeholder="名前を入力して下さい"
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
        placeholder="メールアドレスを入力して下さい"
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
        @click="submitUser"
        type="submit"
        value="送信"
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
  methods: {
    submitUser() {
      axios
        .post("/api/users", { user: this.user })
        .then((response) => {
          console.log(response);
          const createdUser = response.data.user;
          this.$store.dispatch("flashMessage/catchMessage", {
            message: response.data.message,
            timeout: 5000,
          });
          this.$store.dispatch("userInfo/changeLogin", createdUser);
          this.$router.push({
            name: "teachers_user_show_path",
            params: { id: createdUser.id },
          });
        })
        .catch((error) => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
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