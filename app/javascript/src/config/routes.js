import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import HomeIndex from '../components/home/index.vue';
import SignIn from '../components/session/sign_in.vue';
import Register from '../components/session/register.vue';
import Error500 from '../components/errors/500.vue';
import Error404 from '../components/errors/404.vue';

Vue.use(VueRouter);
const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: HomeIndex, name: 'root_path' },
    { path: '/sign_in', component: SignIn, name: 'sign_in_path' },
    { path: '/register', component: Register, name: 'register_path' },
    { path: '/500', component: Error500 },
    { path: '/404', component: Error404 },
    { path: '*', redirect: '/404' },
  ],
});

export default router;
