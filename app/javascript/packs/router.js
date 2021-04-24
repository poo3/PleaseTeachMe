import Vue from "vue/dist/vue.esm";
import VueRouter from "vue-router";
import Home from "../components/staticpages/Home";
import Help from "../components/staticpages/Help";
import Contact from "../components/staticpages/Contact";
import Entrance from "../components/sessions/Entrance";
import Register from "../components/sessions/Register";
import StudentNew from "../components/student/StudentNew";
import TeacherNew from "../components/teacher/TeacherNew";
import StudentShow from "../components/student/StudentShow";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Home, name: "home_path" },
    { path: "/help", component: Help, name: "help_path" },
    { path: "/contact", component: Contact, name: "contact_path" },
    { path: "/entrance", component: Entrance, name: "entrance_path" },
    { path: "/register", component: Register, name: "register_path" },
    { path: "/students/new", component: StudentNew, name: "student_new_path" },
    { path: "/teachers/new", component: TeacherNew, name: "teacher_new_path" },
    {
      path: "/students/:id(\\d+)",
      component: StudentShow,
      name: "student_user_show_path",
    },
  ],
});

export default router;
