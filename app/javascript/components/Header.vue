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
      <div class="nav-usermenu">
        <img src="~user-menu-logo.png" alt="user-menu-logo-img" />
      </div>
    </nav>
  </header>
</template>

<script>
import "please_teach_me.png";
import "user-menu-logo.png";
import "PleaseTeachMe-background-home.png";
export default {};
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
  }
}
</style>