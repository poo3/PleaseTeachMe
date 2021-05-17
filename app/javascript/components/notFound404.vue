<template>
  <div class="notfound404-wrapper">
    <div class="notfound-heading-wrapper">
      <h1>お探ししたページは見つかりませんでした</h1>
    </div>
    <div class="notfound-img-wrapper">
      <img src="~404notFound" alt="" />
    </div>
    <div class="text-center">
      <v-btn rounded color="#880016" dark
        ><router-link :to="{ name: `home_path` }"
          >TOPページへ戻る</router-link
        ></v-btn
      >
    </div>
  </div>
</template>

<script>
import "404notFound.png";
export default {};
</script>

<style lang="scss" scoped>
.notfound404-wrapper {
  text-align: center;
  > .notfound-heading-wrapper {
    margin: 2rem 0;
  }
  > .notfound-img-wrapper {
    margin: 1rem;
    > img {
      width: 30%;
    }
  }
  > .text-center {
    margin: 3rem 0;
    > button {
      > span {
        > a {
          text-decoration: none;
          color: whitesmoke;
        }
      }
    }
  }
}
</style>