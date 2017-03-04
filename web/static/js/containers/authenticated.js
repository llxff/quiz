import React from "react";
import gql from "graphql-tag"
import { graphql } from "react-apollo"
import { connect } from 'react-redux';
import { routerActions } from "react-router-redux"
import Settings from "../settings"

class AuthenticatedContainer extends React.Component {
  componentDidMount() {
    if(!Settings.authToken()) {
      this.props.dispatch(routerActions.push("/sign_in"));
    }
  }

  render() {
    const { dispatch, data, children } = this.props;

    if(data.loading) {
      return false;
    }
    else {
      if(data.current_user) {
        return children;
      }
      else {
        dispatch(routerActions.push("/sign_in"));

        return <div>redirecting...</div>;
      }
    }
  }
}

const currentUserQuery = gql`
  query GetCurrentUser {
    current_user {
      id,
      email
    }
  }
`;

export default connect((s) => (s))(graphql(currentUserQuery)(AuthenticatedContainer));
