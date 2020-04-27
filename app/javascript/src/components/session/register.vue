<template>
  <div class="container-fluid">
    <div class="row">
      <form @submit="submitForm" class="col-md-4 offset-md-4 pt-4">
        <h1 class="pb-4">{{ $t('register.header') }}</h1>
        <div v-if="errors.length" class="alert alert-danger">
          <div v-for="error in errors">{{ error }}</div>
        </div>
        <label for="name">{{ $t('name') }}</label>
        <input v-model="name" type="text" id="name" class="form-control" autofocus="autofocus" />
        <label for="email">{{ $t('email') }}</label>
        <input v-model="email" type="text" id="email" class="form-control" autofocus="autofocus" />
        <label for="password">{{ $t('password') }}</label>
        <input v-model="password" type="password" id="password" class="form-control" />
        <label for="password_confirmation">{{ $t('passwordConfirmation') }}</label>
        <input v-model="passwordConfirmation" type="password" id="password_confirmation" class="form-control" />
        <button type="submit" class="btn btn-primary mt-3 form-control">
          {{ $t('save') }}
        </button>
        <div class="text-muted text-center pt-4">
          {{ $t('register.orSignIn') }}
          <router-link to="/sign_in">
            <i class="mdi mdi-login" />
            {{ $t('register.signIn') }}
          </router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import { mapMutations } from 'vuex';

export default {
  name: 'SignIn',
  data() {
    return {
      errors: [],
      name: null,
      email: null,
      password: null,
      passwordConfirmation: null,
    };
  },
  methods: {
    ...mapMutations(['signIn']),
    submitForm(e) {
      e.preventDefault();

      this.errors = [];

      if (!this.name) this.errors.push(this.$t('errors.required', { field: 'Name' }));
      if (!this.email) this.errors.push(this.$t('errors.required', { field: 'Email' }));
      if (!this.password) this.errors.push(this.$t('errors.required', { field: 'Password' }));
      if (!this.passwordConfirmation) {
        this.errors.push(this.$t('errors.required', { field: 'Password Confirmation' }));
      }
      if (this.password != this.passwordConfirmation) {
        this.errors.push(this.$t('errors.passwordConfirmation'));
      }

      if (this.errors.length) return;

      this.$apollo.mutate({
        mutation: gql`
          mutation register($name: String!, $email: String!, $password: String!, $passwordConfirmation: String!) {
            register(input: { name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation }) {
              user {
                id
                name
                email
                authenticationToken
              }
              success
              errors
            }
          }
        `,
        variables: {
          name: this.name,
          email: this.email,
          password: this.password,
          passwordConfirmation: this.passwordConfirmation,
        },
      }).then(response => {
        const data = response.data.register;

        if (data.success) {
          this.signIn(data.user.authenticationToken);
          this.$router.push('/');
        } else {
          this.errors = data.errors;
        }
      }).catch(error => {
        this.errors = error.graphQLErrors.map((err) => err.message);
      });
    },
  },
};
</script>
