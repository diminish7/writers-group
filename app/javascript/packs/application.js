import Vue from 'vue/dist/vue.esm';
import VueApollo from 'vue-apollo';

import App from '../src/components/app.vue';

import router from '../src/config/routes';
import i18n from '../src/config/i18n';
import apolloProvider from '../src/config/apolloProvider';


Vue.use(VueApollo);
document.addEventListener('DOMContentLoaded', () => {
  new Vue({ // eslint-disable-line no-new
    el: '#app',
    name: 'AppRoot',
    i18n,
    router,
    apolloProvider,
    render: (h) => h(App),
  });
});
