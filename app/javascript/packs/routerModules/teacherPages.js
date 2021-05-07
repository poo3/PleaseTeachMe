import TeachersNew from "../../components/teachers/TeachersNew";
import TeachersLogin from "../../components/teachers/TeachersLogin";

export default [
  {
    path: "/teachers/new",
    component: TeachersNew,
    name: "teachers_new_path",
  },
  {
    path: "/teachers/login",
    component: TeachersLogin,
    name: "teachers_user_login_path",
  },
];