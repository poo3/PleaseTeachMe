<template>
  <div class="contact-page-wrapper">
    <h1>お問い合わせフォーム</h1>
    <div class="contact-form-wrapper">
      <form>
        <v-text-field
          v-model="name"
          :error-messages="nameErrors"
          label="名前"
          required
          @input="$v.name.$touch()"
          @blur="$v.name.$touch()"
          class="register-text-field"
          counter
        ></v-text-field>
        <v-text-field
          v-model="email"
          :error-messages="emailErrors"
          label="受信メールアドレス"
          required
          @input="$v.email.$touch()"
          @blur="$v.email.$touch()"
          class="register-text-field"
        ></v-text-field>
        <v-textarea
          counter
          v-model="content"
          label="お問い合わせ内容"
          :error-messages="contentErrors"
          @input="$v.content.$touch()"
          @blur="$v.content.$touch()"
          class="register-text-field"
        ></v-textarea>

        <v-btn
          class="mr-4"
          @click="submitContact"
          :disabled="submitStatus === 'PENDING'"
          >登録</v-btn
        >
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { required, email, maxLength } from "vuelidate/lib/validators";
export default {
  validations: {
    name: { required, maxLength: maxLength(20) },
    email: { required, email },
    content: { required, minLength: maxLength(500) },
  },
  data() {
    return {
      name: "",
      email: "",
      content: "",
      submitStatus: null,
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
    nameErrors() {
      const errors = [];
      if (!this.$v.name.$dirty) return errors;
      !this.$v.name.maxLength &&
        errors.push("50文字以内のユーザ名にしてください");
      !this.$v.name.required && errors.push("ユーザ名を入力してください");
      return errors;
    },
    contentErrors() {
      const errors = [];
      if (!this.$v.content.$dirty) return errors;
      !this.$v.content.maxLength &&
        errors.push("お問い合わせ内容を500文字以内で記載してください");
      !this.$v.content.required &&
        errors.push("お問い合わせ内容を入力してください");
      return errors;
    },
  },
  methods: {
    refreshValues() {
      (this.name = ""), (this.email = ""), (this.content = "");
    },
    submitContact() {
      console.log("submit!");
      this.$v.$touch();
      if (this.$v.$invalid) {
        console.log("invalid field value");
        this.submitStatus = "ERROR";
      } else {
        console.log("valid field value");
        // do your submit logic here
        axios
          .post("/api/contacts", {
            contact: {
              name: this.name,
              email: this.email,
              content: this.content,
            },
          })
          .then((response) => {
            this.refreshValues();
            console.log("response!!");
            console.log(response);
            this.$store.dispatch("flashMessage/catchMessage", {
              message: response.data.message,
              timeout: 5000,
            });
          })
          .catch((error) => {
            this.refreshValues();
            console.log("error!!");
            console.log(error);
            this.$store.dispatch("flashMessage/catchMessage", {
              message: error.response.data.message,
              timeout: 5000,
            });
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
</style>