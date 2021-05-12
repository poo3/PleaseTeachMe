// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

require("custom/home");
require("custom/contact");

import "@fortawesome/fontawesome-free/js/all";

import Vue from "vue";
import App from "../app";
import router from "./router";
import store from "../store";
import Vuetify from "vuetify"; // 追加
import "vuetify/dist/vuetify.min.css"; // 追加
// For validate
import Vuelidate from "vuelidate";

Vue.use(Vuelidate);
Vue.use(Vuetify);
const vuetify = new Vuetify();

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    el: "#app",
    router: router,
    store: store,
    vuetify,
    render: (h) => h(App),
  });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
