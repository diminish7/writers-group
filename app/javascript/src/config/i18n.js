import Vue from 'vue/dist/vue.esm';
import VueI18n from 'vue-i18n';

Vue.use(VueI18n);
export default new VueI18n({
  locale: 'en',
  messages: {
    en: {
      email: 'Email',
      errors: {
        internalServerError: '😨 Uh oh! Something went wrong...',
        notFound: '🤷 Sorry, we couldn\'t find the page you were looking for...',
        required: "{field} can't be blank",
      },
      password: 'Password',
      site: {
        title: 'Writers Group',
        sign_in: 'Sign In',
        sign_out: 'Sign Out',
      },
      welcome: 'Welcome!',
    },
  },
});
