import VueApollo from 'vue-apollo';
import ApolloClient from 'apollo-boost';

const apolloClient = new ApolloClient({
  uri: `${window.location.origin}/graphql`,
  request(operation) {
    const authToken = localStorage.getItem('authToken');
    const csrfToken = document.querySelector('meta[name="csrf-token"]').attributes.content.value;

    operation.setContext({
      headers: {
        'X-CSRF-Token': csrfToken,
        authorization: authToken ? `Bearer ${authToken}` : '',
      },
    });
  },
});

export default new VueApollo({ defaultClient: apolloClient });
