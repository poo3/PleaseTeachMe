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
    update(state, updatedUser) {
      state.userLoggedIn = true;
      state.currentUser = updatedUser;
    },
  },
  actions: {
    changeLogin({ commit }, loginUser) {
      commit("login", loginUser);
    },
    changeLogout({ commit }) {
      commit("logout");
    },
    updateUser({ commit }, updatedUser) {
      commit("update", updatedUser);
    },
  },
};
