<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <router-link to="/" class="navbar-brand mr-0">
        <i class="mdi mdi-typewriter" />
      </router-link>

      <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <router-link to="/" class="nav-link">
              {{ $t('site.title') }}
            </router-link>
          </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <a v-if="isSignedIn" @click="performSignOut" href="/sign_out" class="nav-link">
              <i class="mdi mdi-logout" />
              {{ $t('site.signOut') }}
            </a>
            <router-link v-else to="/sign_in" class="nav-link">
              <i class="mdi mdi-login" />
              {{ $t('site.signIn') }}
            </router-link>
          </li>
        </ul>
      </div>
    </nav>
    <slot/>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import { mapGetters, mapMutations } from 'vuex';

export default {
  name: 'Layout',
  computed: {
    ...mapGetters(['isSignedIn']),
  },
  methods: {
    ...mapMutations(['signOut']),
    performSignOut(e) {
      e.preventDefault();

      this.$apollo.mutate({
        mutation: gql`
          mutation signOut {
            signOut(input: {}) {
              success
              errors
            }
          }
        `,
      }).finally(response => {
        // Even if there's an error, we still want to sign the client out
        this.clientSignOut();
      });
    },
    clientSignOut() {
      this.signOut();
      if (this.$route.name !== 'root_path') this.$router.push('/');
    }
  },
};
</script>
