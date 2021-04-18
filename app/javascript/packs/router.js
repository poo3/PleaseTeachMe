import Vue from "vue/dist/vue.esm";
import VueRouter from "vue-router";
import Index from "../app";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [{ path: "/", component: Index, name: "root_path" }],
});

export default router;
