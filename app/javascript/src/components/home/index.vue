<template>
  <div id="home">
    <h3 class="pt-2 text-center">{{ $t('welcome') }}</h3>
    <div class="container-fluid">
      <div class="row">
        <div class="col text-center pt-4">
          <span v-if="isSignedIn">
            {{ $t('home.noGroups') }}
          </span>
          <span v-else>
            <div>
              {{ $t('home.signInMessage') }}
              <router-link to="/sign_in">
                <i class="mdi mdi-login" />
                {{ $t('home.signIn') }}
              </router-link>
            </div>
            <div>
              {{ $t('home.registerMessage') }}
              <router-link to="/registration">
                <i class="mdi mdi-account-plus" />
                {{ $t('home.register') }}
              </router-link>
              {{ $t('home.registerSuffix') }}
            </div>
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  name: 'HomeIndex',
  computed: {
    ...mapGetters(['isSignedIn']),
  },
};
</script>
