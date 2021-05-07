import Vue from "vue/dist/vue.esm";
import VueRouter from "vue-router";
// コンポーネント読み込み
import Home from "../components/staticpages/Home";
import Help from "../components/staticpages/Help";
import Contact from "../components/staticpages/Contact";
import Entrance from "../components/sessions/Entrance";
import Register from "../components/sessions/Register";
import StudentsNew from "../components/students/StudentsNew";
import TeachersNew from "../components/teachers/TeachersNew";
import StudentsLogin from "../components/students/StundentsLogin";
import TeachersLogin from "../components/teachers/TeachersLogin";

Vue.use(VueRouter);
// モジュール読み込み
import authUserPage from "./routerModules/authUserPage";

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Home, name: "home_path" },
    { path: "/help", component: Help, name: "help_path" },
    { path: "/contact", component: Contact, name: "contact_path" },
    { path: "/entrance", component: Entrance, name: "entrance_path" },
    { path: "/register", component: Register, name: "register_path" },
    {
      path: "/students/new",
      component: StudentsNew,
      name: "students_new_path",
    },
    {
      path: "/teachers/new",
      component: TeachersNew,
      name: "teachers_new_path",
    },
    ...authUserPage,
    {
      path: "/students/login",
      component: StudentsLogin,
      name: "students_user_login_path",
    },
    {
      path: "/teachers/login",
      component: TeachersLogin,
      name: "teachers_user_login_path",
    },
  ],
});

export default router;
