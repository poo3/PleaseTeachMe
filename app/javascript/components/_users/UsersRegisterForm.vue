<template>
  <div class="user-form-wrapper">
    <form>
      <v-text-field
        v-model="name"
        :error-messages="nameErrors"
        label="Name"
        required
        @input="$v.name.$touch()"
        @blur="$v.name.$touch()"
        class="register-text-field"
        counter
      ></v-text-field>
      <v-text-field
        v-model="email"
        :error-messages="emailErrors"
        label="E-mail"
        required
        @input="$v.email.$touch()"
        @blur="$v.email.$touch()"
        class="register-text-field"
      ></v-text-field>
      <v-text-field
        v-model="password"
        :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
        :error-messages="passwordErrors"
        :type="show1 ? 'text' : 'password'"
        @input="$v.password.$touch()"
        @blur="$v.password.$touch()"
        name="input-10-1"
        label="パスワード"
        counter
        @click:append="show1 = !show1"
        class="register-text-field"
      ></v-text-field>
      <v-text-field
        v-model="password_confirmation"
        :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
        :type="show2 ? 'text' : 'password'"
        :error-messages="password_confirmationErrors"
        name="input-10-1"
        label="パスワードの確認"
        counter
        @input="$v.password_confirmation.$touch()"
        @blur="$v.password_confirmation.$touch()"
        @click:append="show2 = !show2"
        class="register-text-field"
      ></v-text-field>

      <v-btn
        class="mr-4"
        @click="submitUser"
        :disabled="submitStatus === 'PENDING'"
        >新規登録</v-btn
      >
    </form>
  </div>
</template>

<script>
import axios from "axios";
import {
  required,
  email,
  maxLength,
  minLength,
  sameAs,
} from "vuelidate/lib/validators";
export default {
  validations: {
    name: { required, maxLength: maxLength(50) },
    email: { required, email },
    password: { required, minLength: minLength(8) },
    password_confirmation: { required, sameAsPassword: sameAs(`password`) },
  },
  data() {
    return {
      errors: "",
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
      user_type: this.user_type,
      show1: false,
      show2: false,
      submitStatus: null,
    };
  },
  props: ["user_type"],
  computed: {
    emailErrors() {
      const errors = [];
      if (!this.$v.email.$dirty) return errors;
      !this.$v.email.email && errors.push("無効なメールアドレスです");
      !this.$v.email.required &&
        errors.push("メールアドレスを入力してください");
      return errors;
    },
    nameErrors() {
      const errors = [];
      if (!this.$v.name.$dirty) return errors;
      !this.$v.name.maxLength &&
        errors.push("50文字以内のユーザ名にしてください");
      !this.$v.name.required && errors.push("ユーザ名を入力してください");
      return errors;
    },
    passwordErrors() {
      const errors = [];
      if (!this.$v.password.$dirty) return errors;
      !this.$v.password.minLength &&
        errors.push("半角英数字8文字以上のパスワードにしてください");
      !this.$v.password.required && errors.push("パスワードを入力してください");
      return errors;
    },
    password_confirmationErrors() {
      const errors = [];
      if (!this.$v.password_confirmation.$dirty) return errors;
      !this.$v.password_confirmation.sameAsPassword &&
        errors.push("パスワードが一致しません");
      return errors;
    },
  },
  methods: {
    submitUser() {
      console.log("submit!");
      this.$v.$touch();
      if (this.$v.$invalid) {
        console.log("invalid field value");
        this.submitStatus = "ERROR";
      } else {
        console.log("valid field value");
        // do your submit logic here
        axios
          .post("/api/users", {
            user: {
              name: this.name,
              email: this.email,
              password: this.password,
              password_confirmation: this.password_confirmation,
              user_type: this.user_type,
            },
          })
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
        this.submitStatus = "PENDING";
        setTimeout(() => {
          this.submitStatus = "OK";
        }, 500);
      }
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
  > .register-text-field {
    margin: 1rem 0;
  }
}

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