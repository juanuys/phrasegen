// App.vue

<template lang="pug">
  .container Hello {{you}}
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  data() {
    return {
      you: "World!"
    };
  }
});
</script>

<style lang="scss" scoped>
.container {
  color: green;
}
</style>