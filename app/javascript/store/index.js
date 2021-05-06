import Vue from "vue/dist/vue.esm";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";
import { userInfo, flashMessage } from "./modules";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    userInfo,
    flashMessage,
  },
  state: {},
  // `createPersistedState()`でインスタンス作成。引数に設定を書く
  plugins: [
    createPersistedState({
      // ストレージのキーを指定。デフォルトではvuex
      key: "pleaseTeachMe",

      // 管理対象のステートを指定。pathsを書かない時は`modules`に書いたモジュールに含まれるステート全て。`[]`の時はどれも保存されない
      paths: ["userInfo.userLoggedIn", "userInfo.currentUser"],

      // ストレージの種類を指定する。デフォルトではローカルストレージ
      storage: window.sessionStorage,
    }),
  ],
  mutations: {},
  actions: {},
});
