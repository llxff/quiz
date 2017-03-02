import React from "react";
import gql from "graphql-tag"
import { graphql } from "react-apollo"

class NextWord extends React.Component {
  render() {
    return <button className="btn btn-default" onClick={ ::this.next }>Следующее</button>
  }

  next() {
    const { word_id, quiz_id, onClick, mutate } = this.props;

    mutate({
      variables: { quiz_id: quiz_id, word_id: +word_id }
    })
    .then(onClick);
  }
}

const updateQuizIdQuery = gql`
  mutation UpdateQuizId($quiz_id: String!, $word_id: Int!) {
    update_quiz_id(quiz_id: $quiz_id, word_id: $word_id) {
      id
    }
  }
`;

export default graphql(updateQuizIdQuery)(NextWord);
