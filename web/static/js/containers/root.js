import React        from "react";
import { Router }   from "react-router";
import routes       from "../routes";
import ApolloClient, { createNetworkInterface, addTypename } from "apollo-client"
import { ApolloProvider } from "react-apollo"
import configureStore     from "../store";
import { browserHistory } from "react-router";

const client = new ApolloClient({
  networkInterface: createNetworkInterface({ uri: "/api" }),
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
