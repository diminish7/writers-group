import { Store } from 'vuex'

export default function createStore() {
  return new Store({
    state() {
      return {
        authToken: localStorage.getItem('authToken'),
      }
    },
    mutations: {
      signIn(state, authToken) {
        localStorage.setItem('authToken', authToken);
        state.authToken = authToken;
      },
      signOut(state) {
        localStorage.removeItem('authToken');
        state.authToken = null;
      }
    },
    getters: {
      isSignedIn(state) {
        return state.authToken !== null;
      }
    },
  });
};
