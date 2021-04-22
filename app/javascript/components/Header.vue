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
          <router-link to="help">ヘルプ</router-link>
        </div>
        <div class="nav-menu">
          <router-link to="contact">お問い合わせ</router-link>
        </div>
      </div>
      <div class="nav-usermenu" @click="usermenuToggle()">
        <img src="~user-menu-logo.png" alt="user-menu-logo-img" />
        <div class="usermenu-wrapper" v-show="usermenuActivated">
          <ul>
            <router-link to="help" tag="li">ログイン</router-link>
            <router-link to="contact" tag="li">新規登録</router-link>
          </ul>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
import "please_teach_me.png";
import "user-menu-logo.png";
import "PleaseTeachMe-background-home.png";
export default {
  data() {
    return { usermenuActivated: false };
  },
  created: {},
  computed: {},
  methods: {
    usermenuToggle() {
      const usermenuElement = document.querySelector(".usermenu-wrapper");
      usermenuElement.classList.toggle("usermenu--active");
      this.usermenuActivated = !this.usermenuActivated;
    },
  },
};
</script>

<style lang="scss" scoped>
nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-image: url("~PleaseTeachMe-background-home.png");
  background-repeat: no-repeat;
  > .nav-application-logo {
    margin-left: 5rem;
  }
  > .nav-menu-wrapper {
    display: flex;
    margin-right: 40rem;
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
}
</style>