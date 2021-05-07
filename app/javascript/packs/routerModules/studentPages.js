import StudentsNew from "../../components/students/StudentsNew";
import StudentsLogin from "../../components/students/StundentsLogin";

export default [
  {
    path: "/students/login",
    component: StudentsLogin,
    name: "students_user_login_path",
  },
  {
    path: "/students/new",
    component: StudentsNew,
    name: "students_new_path",
  },
];
