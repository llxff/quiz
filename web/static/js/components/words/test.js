import React from "react";
import gql from "graphql-tag"
import { graphql } from "react-apollo"
import WordInfo from "./info"
import MarkAsStudied from "./test/mark_as_studied"
import NextWord from "./test/next_word"

class TestWord extends React.Component {
  constructor(props) {
    super(props)

    this.state = { info: false }
  }

  render() {
    const { quiz_id, data: { quiz_word }} = this.props;

    if (quiz_word) {
      return (
        <div className="text-center">
          <div>
            <h1>{ quiz_word.name }</h1>
            <div>
              { ::this.renderInfo(quiz_word) }
            </div>
          </div>
          <div>
            <MarkAsStudied quiz_id={ quiz_id } word_id={ quiz_word.id } onClick={ ::this.next } />
            <span> </span>
            <button className="btn btn-info" onClick={ ::this.check }>Проверить</button>
            <span> </span>
            <NextWord quiz_id={ quiz_id } word_id={ quiz_word.id } onClick={ ::this.next } />
          </div>
        </div>
      )
    }
    else {
      return <div>...</div>
    }
  }

  renderInfo(word) {
    if(this.state.info) {
      return <WordInfo word={ word } />
    }
  }

  check() {
    this.setState({ info: true });
  }

  next() {
    this.setState({ info: false });
    this.props.data.refetch();
  }
}

const wordQuery = gql`
  query GetQuizWord($quiz_id: String!) {
    quiz_word(quiz_id: $quiz_id) {
      id,
      name,
      translation,
      example
    }
  }
`;

const queryOptions = ({ quiz_id }) => {
  return { variables: { quiz_id: quiz_id } }
};

export default graphql(wordQuery, { options: queryOptions })(TestWord);
