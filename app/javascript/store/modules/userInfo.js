export default {
  namespaced: true,
  state: {
    userLoggedIn: "",
    currentUser: {},
  },
  mutations: {
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
    changeLogin({ commit }, loginUser) {
      commit("login", loginUser);
    },
    changeLogout({ commit }) {
      commit("logout");
    },
  },
};
