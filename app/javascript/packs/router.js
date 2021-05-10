import Vue from "vue";
import VueRouter from "vue-router";
// コンポーネント読み込み

Vue.use(VueRouter);
// モジュール読み込み
import authUserPage from "./routerModules/authUserPage";
import studentPages from "./routerModules/studentPages";
import teacherPages from "./routerModules/teacherPages";
import staticPages from "./routerModules/staticPages";

const router = new VueRouter({
  mode: "history",
  routes: [...authUserPage, ...studentPages, ...teacherPages, ...staticPages],
});

export default router;
