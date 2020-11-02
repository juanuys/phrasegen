// App.vue

<template lang="pug">
  .container
    .words
      word(v-for="idx in numberOfWords" :key="idx")

    .settings
      .howmany
        button(type="button" v-on:click="dec") -
        span {{numberOfWords}} words
        button(type="button" v-on:click="inc") +
      .rando
        button(type="button" v-on:click="rando") Randomise

    colophon
</template>

<script lang="ts">
import Vue from "vue"
import Word from "./Word"
import Colophon from "./Colophon"
import {EventBus} from "./eventbus"

export default Vue.extend({
  data() {
    return {
      numberOfWords: 2,
    }
  },
  components: {
    Word,
    Colophon,
  },
  methods: {
    inc: function() {
      if (this.numberOfWords < 5) {
        this.numberOfWords += 1
      }
    },
    dec: function() {
      if (this.numberOfWords > 2) {
        this.numberOfWords -= 1
      }
    },
    rando: function() {
      EventBus.$emit('randomise')
    }
  }
})
</script>

<style lang="scss" scoped>
* {
  box-sizing: border-box
}
.container {
}
.settings {
  clear: both;
  max-width: 320px;
}
.howmany {
  & > * {
    display: inline-block;
    padding: 10px;
  }
  span {
    font-size: 2em;
    background-color: lightgoldenrodyellow;
    width: 70%;
    text-align: center;
  }
  button {
    font-size: 2em;
    background-color: lightskyblue;
    width: 15%;
  }
}

.rando {
  width: 100%;
  & > * {
    display: inline-block;
    padding: 10px;
  }
  button {
    font-size: 2em;
    background-color: lightsteelblue;
    width: 100%;
  }
}

button {
  border: none;
  cursor: pointer;
}
button:active {
  background-color: indianred;
}
</style>
