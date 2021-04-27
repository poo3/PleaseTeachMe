import Vue from "vue/dist/vue.esm";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    flashMessage: "",
  },
  mutations: {
    setMessage(state, { message, timeout }) {
      state.flashMessage = message;
      if (typeof timeout === "undefined") {
        timeout = 3000;
      }

      setTimeout(() => (state.flashMessage = ""), timeout);
    },
  },
  actions: {
    catchMessage({ commit }, { message, timeout }) {
      commit("setMessage", {
        message: message,
        timeout: timeout,
      });
    },
  },
});
