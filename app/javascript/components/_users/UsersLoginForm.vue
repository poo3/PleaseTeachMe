<template>
  <div class="user-form-wrapper">
    <form>
      <v-text-field
        v-model="email"
        :error-messages="emailErrors"
        label="E-mail"
        required
        @input="$v.email.$touch()"
        @blur="$v.email.$touch()"
        class="login-text-field"
      ></v-text-field>
      <v-text-field
        v-model="password"
        :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
        :rules="[rules.required, rules.min]"
        :type="show1 ? 'text' : 'password'"
        name="input-10-1"
        label="パスワード"
        counter
        @click:append="show1 = !show1"
      ></v-text-field>

      <v-btn class="mr-4" @click="submitUser">ログイン</v-btn>
    </form>
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
// validationのためにインポート
// import { validationMixin } from "vuelidate";
import { required, email } from "vuelidate/lib/validators";

export default {
  validations: {
    email: { required, email },
  },
  data() {
    return {
      error: false,
      email: "",
      password: "",
      rules: {
        required: (value) => !!value || "パスワードを入力してください",
        min: (v) => v.length >= 8 || "８文字以上入力してください",
        emailMatch: () => `The email and password you entered don't match`,
      },
      show1: false,
    };
  },
  computed: {
    emailErrors() {
      const errors = [];
      if (!this.$v.email.$dirty) return errors;
      !this.$v.email.email && errors.push("無効なメールアドレスです");
      !this.$v.email.required &&
        errors.push("メールアドレスを入力してください");
      return errors;
    },
    sessionEmail() {
      return this.email;
    },
    sessionPassword() {
      return this.password;
    },
  },
  methods: {
    submitUser() {
      axios
        .post("/api/login", {
          session: { email: this.email, password: this.password },
        })
        .then((response) => {
          console.log(response);
          const loggedinUser = response.data.user;
          this.$store.dispatch("flashMessage/catchMessage", {
            message: response.data.message,
            timeout: 5000,
          });
          this.$store.dispatch("userInfo/changeLogin", loggedinUser);
          this.$router.push({
            name: "teachers_user_show_path",
            params: { id: loggedinUser.id },
          });
        })
        .catch((error) => {
          console.log(error);
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
form {
  width: 40%;
  margin: 2rem auto;
  text-align: center;
  > v-btn {
    margin: 1rem auto;
  }
  > .login-text-field {
    margin: 1rem 0;
  }
}

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