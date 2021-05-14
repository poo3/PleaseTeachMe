<template>
  <header>
    <nav>
      <div class="nav-application-logo">
        <router-link to="/">
          <img src="~please_teach_me.png" alt="please_teach_me_logo_img" />
        </router-link>
      </div>
      <div class="nav-menu-wrapper">
        <div class="nav-menu">
          <router-link :to="{ name: `help_path` }">ヘルプ</router-link>
        </div>
        <div class="nav-menu">
          <router-link :to="{ name: `contact_path` }">お問い合わせ</router-link>
        </div>
      </div>
      <div class="text-center">
        <v-menu
          v-model="menu"
          :close-on-content-click="false"
          :nudge-width="150"
          offset-x
          left
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="#880016" dark v-bind="attrs" v-on="on">
              メニュー
            </v-btn>
          </template>
          <v-list>
            <router-link
              :to="{ name: `entrance_path` }"
              tag="li"
              v-if="!loggedIn"
              >ログイン</router-link
            >
            <router-link
              :to="{
                name: `${currentUserType}s_user_show_path`,
                params: { id: currentUserId },
              }"
              tag="li"
              v-if="loggedIn"
              >マイページ</router-link
            >
            <router-link
              :to="{
                name: `teachers_user_edit_path`,
                params: { id: currentUserId },
              }"
              tag="li"
              v-if="loggedIn"
              >登録内容編集</router-link
            >
            <router-link :to="{ name: `register_path` }" tag="li"
              >新規登録</router-link
            >
            <li @click="logout" v-if="loggedIn">ログアウト</li>
          </v-list>
        </v-menu>
      </div>
    </nav>
  </header>
</template>

<script>
import "please_teach_me.png";
import "user-menu-logo.png";
import "PleaseTeachMe-background-home.png";
import axios from "axios";
export default {
  data() {
    return { usermenuActivated: false };
  },
  created: {},
  computed: {
    loggedIn() {
      return this.$store.state.userInfo.userLoggedIn;
    },
    currentUserId() {
      if (this.$store.state.userInfo.currentUser) {
        return this.$store.state.userInfo.currentUser.id;
      }
    },
    currentUserType() {
      if (this.$store.state.userInfo.currentUser) {
        return this.$store.state.userInfo.currentUser.user_type;
      }
    },
  },
  methods: {
    usermenuToggle() {
      const usermenuElement = document.querySelector(".usermenu-wrapper");
      usermenuElement.classList.toggle("usermenu--active");
      this.usermenuActivated = !this.usermenuActivated;
    },
    logout() {
      axios.delete("/api/logout").then((response) => {
        console.log(response);
        console.log(this);
        this.$store.dispatch("flashMessage/catchMessage", {
          message: response.data.message,
          timeout: 5000,
        });
        this.$store.dispatch("userInfo/changeLogout");
        this.$router.push({
          name: "home_path",
          params: { message: response.data.message },
        });
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.v-menu__content {
  > .v-list {
    list-style: none;
    width: 100%;
    > li {
      padding: 0.5rem 1rem;
      width: 100%;
      cursor: pointer;
    }
    > li:hover {
      background-color: rgba(0, 0, 0, 0.04);
    }
  }
}
nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-image: url("~PleaseTeachMe-background-home.png");
  background-repeat: no-repeat;
  padding: 1rem 3rem;
  width: 100%;
  height: 100%;
  > .nav-application-logo {
    margin-left: 5rem;
  }
  > .nav-menu-wrapper {
    display: flex;
    justify-content: flex-start;
    > .nav-menu {
      margin: 0 5rem;
      > a {
        text-decoration: none;
        color: whitesmoke;
        font-weight: bold;
        font-size: 1.3rem;
      }
      > a:hover {
        color: black;
      }
    }
  }
  > .nav-usermenu {
    margin-right: 5rem;
    background-color: whitesmoke;
    display: flex;
    justify-content: center;
    align-content: center;
    width: 4rem;
    height: 3rem;
    border-radius: 1.5rem;
    position: relative;
    > .usermenu-wrapper {
      padding: 1.5rem 0;
      position: absolute;
      top: 100%;
      right: 0;
      width: 400%;
      border: 1px solid gray;
      border-radius: 2rem;
      background-color: whitesmoke;
      > ul {
        list-style: none;
        width: 100%;
        > li {
          padding: 0.5rem 1rem;
          width: 100%;
        }
        > li:hover {
          background-color: rgba(0, 0, 0, 0.04);
        }
      }
    }
  }
  > .v-menu {
    margin-right: 3rem;
  }
}
</style>