// Word.vue

<template lang="pug">
  div.colophon
    h1(v-on:click='showColophon = !showColophon') Colophon
    div(v-if="showColophon")
      p Random phrases using set parameters.
      p.smaller Why? I need a phrase generator to name my indie game dev studio. My web consultancy is called #[a(href='https://uys.io') Unleash Your Server], which uses the letters from my surname.
      p.smaller I wanted to do this again. Undeniable Yellow Stain? Or Unconventional Yummy Salami? Only time will tell.
      p #[a(href='https://github.com/juanuys/phrasegen') v{{version}}] made by #[a(href='https://juanuys.com') Juan Uys]
</template>

<script lang="ts">
import Vue from "vue"
import pkg from "../package.json"

export default Vue.extend({
  data() {
    return {
      showColophon: false,
      version: pkg.version,
    }
  },
})
</script>

<style lang="scss" scoped>
p.smaller {
  font-size: smaller;
}

.colophon {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-size: 1.2em;
  color: #333;
  margin-top: 60px;

  h1 {
    cursor: pointer;
    font-size: smaller;
    color: darkgray;
    text-decoration: underline;
  }
}
</style>
