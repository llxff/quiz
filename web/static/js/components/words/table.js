import React       from "react";
import { graphql } from "react-apollo"
import gql         from "graphql-tag"

class WordsTable extends React.Component {
  render() {
    const { data: { words } } = this.props;

    if (words) {
      return (
        <table className="table">
          <thead>
          <tr>
            <th>#</th>
            <th>Слово</th>
            <th>Перевод</th>
            <th>Пример</th>
          </tr>
          </thead>
          <tbody>
          {
            words.map((word) => {
              return(
                <tr key={ word.id }>
                  <td>{ word.id }</td>
                  <td>{ word.name }</td>
                  <td>{ word.translation }</td>
                  <td>{ word.example }</td>
                </tr>
              )
            })
          }
          </tbody>
        </table>
      )
    }
    else {
      return <div>...</div>
    }
  }
}

const query = gql`
  query {
    words {
      id,
      name,
      translation,
      example
    }
  }
`;

export default graphql(query)(WordsTable);
