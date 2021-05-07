import StudentsShow from "../../components/students/StudentsShow";
import TeachersShow from "../../components/teachers/TeachersShow";

import axios from "axios";
import store from "../../store/";

export default [
  {
    path: "/students/:id(\\d+)",
    component: StudentsShow,
    name: "students_user_show_path",
    beforeEnter(to, from, next) {
      console.log("beforeEnter");
      if (store.state.userInfo.userLoggedIn) {
        console.log("LoggedIn");
        console.log(store.state.userInfo.currentUser.idf);
        axios
          .post("/api/auth_conf", {
            id: to.params.id,
          })
          .then((response) => {
            next();
          })
          .catch((error) => {
            store.dispatch("flashMessage/catchMessage", {
              message: "無効なアクセスです",
              timeout: 5000,
            });
            next({ name: "entrance_path" });
          });
      } else {
        store.dispatch("flashMessage/catchMessage", {
          message: "ログインしてください",
          timeout: 5000,
        });
        next({ name: "entrance_path" });
      }
    },
  },
  {
    path: "/teachers/:id(\\d+)",
    component: TeachersShow,
    name: "teachers_user_show_path",
    beforeEnter(to, from, next) {
      console.log("beforeEnter");
      if (store.state.userInfo.userLoggedIn) {
        console.log("LoggedIn");
        console.log(store.state.userInfo.currentUser.idf);
        axios
          .post("/api/auth_conf", {
            id: to.params.id,
          })
          .then((response) => {
            next();
          })
          .catch((error) => {
            store.dispatch("flashMessage/catchMessage", {
              message: "無効なアクセスです",
              timeout: 5000,
            });
            next({ name: "entrance_path" });
          });
      } else {
        store.dispatch("flashMessage/catchMessage", {
          message: "ログインしてください",
          timeout: 5000,
        });
        next({ name: "entrance_path" });
      }
    },
  },
];
