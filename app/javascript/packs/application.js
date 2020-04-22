/* eslint no-console: 0 */

import Vue from 'vue/dist/vue.esm';
import VueI18n from 'vue-i18n';
import router from '../src/routes';
import Layout from '../src/components/shared/layout.vue';

Vue.use(VueI18n);
const i18n = new VueI18n({
  locale: 'en',
  messages: {
    en: {
      errors: {
        notFound: '🤷 Sorry, we couldn\'t find the page you were looking for...',
        internalServerError: '😨 Uh oh! Something went wrong...',
      },
      site: {
        title: 'Writers Group',
        login: 'Log In',
        logout: 'Log Out',
      },
      welcome: 'Welcome!',
    },
  },
});

document.addEventListener('DOMContentLoaded', () => {
  new Vue({ // eslint-disable-line no-new
    i18n,
    router,
    components: {
      Layout,
    },
  }).$mount('#app');
});
