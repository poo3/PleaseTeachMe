const { environment } = require("@rails/webpacker");
const { VueLoaderPlugin } = require("vue-loader");
const vue = require("./loaders/vue");

// vue/dist/vue.esmではなく"vue"をインポートするため
const resolver = {
  resolve: {
    alias: {
      vue$: "vue/dist/vue.esm.js",
    },
  },
};
environment.config.merge(resolver);

environment.plugins.prepend("VueLoaderPlugin", new VueLoaderPlugin());
environment.loaders.prepend("vue", vue);
module.exports = environment;
