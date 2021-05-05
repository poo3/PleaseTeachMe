import Vue from "vue/dist/vue.esm";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    flashMessage: "",
    userLoggedIn: "",
    currentUser: {},
  },
  // `createPersistedState()`でインスタンス作成。引数に設定を書く
  plugins: [
    createPersistedState({
      // ストレージのキーを指定。デフォルトではvuex
      key: "pleaseTeachMe",

      // 管理対象のステートを指定。pathsを書かない時は`modules`に書いたモジュールに含まれるステート全て。`[]`の時はどれも保存されない
      // paths: [],

      // ストレージの種類を指定する。デフォルトではローカルストレージ
      storage: window.sessionStorage,
    }),
  ],
  mutations: {
    setMessage(state, { message, timeout }) {
      state.flashMessage = message;
      if (typeof timeout === "undefined") {
        timeout = 3000;
      }

      setTimeout(() => {
        state.flashMessage = "";
      }, timeout);
    },
    login(state, loginUser) {
      state.userLoggedIn = true;
      state.currentUser = loginUser;
    },
    logout(state) {
      state.userLoggedIn = false;
      state.currentUser = {};
    },
  },
  actions: {
    catchMessage({ commit }, { message, timeout }) {
      commit("setMessage", {
        message: message,
        timeout: timeout,
      });
    },
    changeLogin({ commit }, loginUser) {
      commit("login", loginUser);
    },
    changeLogout({ commit }) {
      commit("logout");
    },
  },
});
