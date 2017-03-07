import React from "react"
import { Link } from "react-router"
import { graphql } from "react-apollo"
import gql from "graphql-tag"
import Word from "../../components/words/show"

class ShowWordView extends React.Component {
  render() {
    const { data: { word_web } } = this.props;

    if(word_web) {
      return (
        <Word word={ word_web.word } />
      )
    }
    else {
      return (
        <div>Loading...</div>
      )
    }
  }
}

const query = gql`
  query GetWordWeb($id: Int!) {
    word_web(id: $id) {
      word {
        id,
        name
      }
    }
  }
`;

const queryOptions = ({ params: { id }}) => {
  return { variables: { id: +id }};
};

export default graphql(query, { options: queryOptions })(ShowWordView);
