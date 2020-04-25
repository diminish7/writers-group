<template>
  <div class="container-fluid">
    <div class="row">
      <form @submit="submitForm" class="col-md-4 offset-md-4 pt-4">
        <div v-if="errors.length" class="alert alert-danger">
          <div v-for="error in errors">{{ error }}</div>
        </div>
        <label for="email">{{ $t('email') }}</label>
        <input v-model="email" type="text" id="email" class="form-control" autofocus="autofocus" />
        <label for="password">{{ $t('password') }}</label>
        <input v-model="password" type="password" id="password" class="form-control" />
        <button type="submit" class="btn btn-primary mt-2 form-control">
          {{ $t('site.sign_in') }}
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import gql from 'graphql-tag';

export default {
  name: 'SignIn',
  data() {
    return {
      errors: [],
      email: null,
      password: null,
    };
  },
  methods: {
    submitForm(e) {
      e.preventDefault();

      this.errors = [];

      if (!this.email) this.errors.push(this.$t('errors.required', { field: 'Email' }));
      if (!this.password) this.errors.push(this.$t('errors.required', { field: 'Password' }));

      if (this.errors.length) return;

      this.$apollo.mutate({
        mutation: gql`
          mutation signIn($email: String!, $password: String!) {
            signIn(input: { email: $email, password: $password }) {
              user {
                id
                name
                authenticationToken
              }
              success
              errors
            }
          }
        `,
        variables: {
          email: this.email,
          password: this.password,
        },
      }).then(response => {
        const data = response.data.signIn;

        if (data.success) {
          localStorage.setItem('authToken', data.user.authenticationToken);
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
