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
      home: {
        noGroups: "It doesn't look like you're a member of any writers groups yet. Would you like to create one?",
        signInMessage: 'Already have an account?',
        signIn: 'sign in',
        registerMessage: 'Otherwise, take a moment to',
        register: 'register',
        registerSuffix: 'now!',
      },
      password: 'Password',
      site: {
        title: 'Writers Group',
        register: 'Register',
        signIn: 'Sign In',
        signOut: 'Sign Out',
      },
      welcome: 'Welcome to Writers Group!',
    },
  },
});
