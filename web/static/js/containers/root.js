import React        from "react";
import { Router }   from "react-router";
import routes       from "../routes";
import ApolloClient, { addTypename } from "apollo-client"
import { ApolloProvider } from "react-apollo"
import configureStore     from "../store";
import { browserHistory } from "react-router";
import networkInterface from "../apollo/network_interface"

const client = new ApolloClient({
  networkInterface: networkInterface,
  queryTransformer: addTypename
});

const store = configureStore(client, browserHistory);

export default class Root extends React.Component {
  render() {
    return (
      <ApolloProvider client={ client } store={ store }>
        <div>
          <Router history={ browserHistory } children={ routes } />
        </div>
      </ApolloProvider>
    )
  }
}
