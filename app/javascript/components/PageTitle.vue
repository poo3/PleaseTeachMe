<template>
  <div class="page-title">
    <h1>{{ pageTitle }}</h1>
  </div>
</template>

<script>
export default {
  props: ["pageTitle"],
};
</script>

<style scoped>
h1 {
  font-size: 3rem;
  color: whitesmoke;
}
</style>