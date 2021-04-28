import Vue from "vue/dist/vue.esm";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    flashMessage: "",
    userLoggedIn: "",
  },
  mutations: {
    setMessage(state, { message, timeout }) {
      state.flashMessage = message;
      if (typeof timeout === "undefined") {
        timeout = 3000;
      }

      setTimeout(() => (state.flashMessage = ""), timeout);
    },
    login(state) {
      state.userLoggedIn = true;
    },
    logout(state) {
      state.userLoggedIn = false;
    },
  },
  actions: {
    catchMessage({ commit }, { message, timeout }) {
      commit("setMessage", {
        message: message,
        timeout: timeout,
      });
    },
    changeLogin({ commit }) {
      commit("login");
    },
    changeLogout({ commit }) {
      commit("logout");
    },
  },
});
