import Vue from "vue/dist/vue.esm";
import VueRouter from "vue-router";
import Home from "../components/staticpages/Home";
import Help from "../components/staticpages/Help";
import Contact from "../components/staticpages/Contact";
import Entrance from "../components/sessions/Entrance";
import Register from "../components/sessions/Register";
import StudentsNew from "../components/students/StudentsNew";
import TeachersNew from "../components/teachers/TeachersNew";
import StudentsShow from "../components/students/StudentsShow";
import TeachersShow from "../components/teachers/TeachersShow";

Vue.use(VueRouter);

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
    {
      path: "/students/:id(\\d+)",
      component: StudentsShow,
      name: "students_user_show_path",
    },
    {
      path: "/teachers/:id(\\d+)",
      component: TeachersShow,
      name: "teachers_user_show_path",
    },
  ],
});

export default router;
