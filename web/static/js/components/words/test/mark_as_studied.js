import React from "react";
import gql from "graphql-tag"
import { graphql } from "react-apollo"

class MarkAsStudied extends React.Component {
  render() {
    return <button className="btn btn-success" onClick={ ::this.iKnow }>Знаю</button>
  }

  iKnow() {
    const { word_id, quiz_id, onClick, mutate } = this.props;

    mutate({
      variables: { quiz_id: quiz_id, word_id: +word_id }
    })
    .then(onClick);
  }
}

const markAsStudiedQuery = gql`
  mutation MarkAsStudied($quiz_id: String!, $word_id: Int!) {
    mark_as_studied(quiz_id: $quiz_id, word_id: $word_id) {
      id
    }
  }
`;

export default graphql(markAsStudiedQuery)(MarkAsStudied);
