<template>
  <div>
    <layout></layout>
    <router-view></router-view>
  </div>
</template>
<script>
import Layout from './shared/layout.vue';

export default {
  name: 'App',
  components: { Layout },
};
</script>
