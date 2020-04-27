import VueApollo from 'vue-apollo';
import ApolloClient from 'apollo-boost';

const apolloClient = new ApolloClient({
  uri: `${window.location.origin}/graphql`,
  request(operation) {
    const authToken = localStorage.getItem('authToken');

    operation.setContext({
      headers: {
        authorization: authToken ? `Bearer ${authToken}` : '',
      },
    });
  },
});

export default new VueApollo({ defaultClient: apolloClient });
