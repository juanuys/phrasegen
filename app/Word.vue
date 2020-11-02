// Word.vue

<template lang="pug">
  .parent
    .word {{word}}
    .options
      div
        select(v-model="letter")
          option(v-for="l in letters") {{l}}
      div
        select(v-model="wordType")
          option(v-for="wt in wordTypes") {{wt}}

      div
        input(type="checkbox" v-model="locked" name="Locked")
        span.checkboxtext Locked
</template>

<script lang="ts">
import Vue from "vue"
import {EventBus} from "./eventbus"
import nouns from "./data/nouns.json"
import adjectives from "./data/adjectives.json"

// https://stackoverflow.com/a/24597663/51280
function alphabet(charA, charZ) {
  const a = []
  let i = charA.charCodeAt(0)
  let j = charZ.charCodeAt(0)
  for (; i <= j; ++i) {
    a.push(String.fromCharCode(i))
  }
  return a
}

export default Vue.extend({
  data() {
    return {
      wordTypes: ["adjective", "noun"],
      wordType: "noun",
      random: Math.random(),
      locked: false,
      letters: alphabet('a', 'z'),
      letter: 'a',
    }
  },
  computed: {
    word: function () {
      if (this.wordType === "noun") {
        let noun = nouns[this.letter];
        return noun[Math.floor(this.random * noun.length)]
      } else {
        let adjective = adjectives[this.letter];
        return adjective[Math.floor(this.random * adjective.length)]
      }
    }
  },
  created (){
    EventBus.$on('randomise', () => {
      if (!this.locked) {
        this.random = Math.random()
      }
    })
  }
})
</script>

<style lang="scss" scoped>
p {
  color: indianred;
}
.parent {
  float: left;
  padding: 30px;
}
.word {
  padding: 30px;
  font-size: 3em;
  background-color: cornsilk;
}
.options {
  //padding: 30px;
  margin: 30px;
  //white-space: nowrap;
  //display: table;
  div {
    //display: table-cell;
    display: inline-block;
    margin-left: 1em;
  }
}
select {
  height: 3em;
  padding: 0 1em;
}
//input[type='checkbox'] {
//  width: 3em;
//  height: 3em;
//}

input[type=checkbox]
{
  /* Double-sized Checkboxes */
  -ms-transform: scale(3); /* IE */
  -moz-transform: scale(3); /* FF */
  -webkit-transform: scale(3); /* Safari and Chrome */
  -o-transform: scale(3); /* Opera */
  transform: scale(3);
  //padding: 10px;
  margin-left: 20px;
}

/* Might want to wrap a span around your checkbox text */
.checkboxtext
{
  /* Checkbox text */
  font-size: 1.2em;
  display: inline;
  margin-left: 1em;
}
</style>
