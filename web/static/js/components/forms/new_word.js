import React from "react";
import { graphql } from "react-apollo";
import gql from "graphql-tag";
import { connect } from "react-redux";
import { routerActions } from "react-router-redux";

class NewWordForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      name: "",
      translation: "",
      example: "",
      errors: {}
    };
  }

  render() {
    return (
      <form>
        <div className="form-group">
          <label htmlFor="nameInput">Слово</label>
          <input type="text"
                 className="form-control"
                 id="nameInput"
                 placeholder="to write"
                 value={ this.state.name }
                 onChange={ ::this.handleChange("name") } />
          <p className="text-danger">{ this.state.errors["name"] }</p>
        </div>
        <div className="form-group">
          <label htmlFor="translationInput">Перевод</label>
          <input type="text"
                 className="form-control"
                 id="translationInput"
                 placeholder="писать"
                 value={ this.state.translation }
                 onChange={ ::this.handleChange("translation") } />
          <p className="text-danger">{ this.state.errors["translation"] }</p>
        </div>
        <div className="form-group">
          <label htmlFor="exampleInput">Пример</label>
          <textarea className="form-control"
                    id="exampleInput"
                    rows="3"
                    placeholder="I'm going to write an example."
                    value={ this.state.example }
                    onChange={ ::this.handleChange("example") }
          ></textarea>
          <p className="text-danger">{ this.state.errors["example"] }</p>
        </div>
        <a className="btn btn-default" onClick={ ::this.saveWord }>Сохранить</a>
      </form>
    )
  }

  handleChange(field) {
    return (event) => {
      this.setState({ [field]: event.target.value });
    }
  }


  saveWord() {
    this.props.mutate({ variables: this.state }).then(({ data }) => {
      const { create_word: { errors, word } } = data;

      if (word) {
        ::this.props.dispatch(routerActions.push("/"))
      }
      else {
        ::this.setState({ errors: errors });
      }
    });
  }
}

const mutation = gql`
  mutation CreateWord($name: String!, $translation: String!, $example: String!) {
    create_word(name: $name, translation: $translation, example: $example) {
      word {
        id
      },
      errors {
        name,
        translation,
        example
      }
    }
  }
`;

const NewFormWithMutation = graphql(mutation)(NewWordForm);

export default connect((s) => (s))(NewFormWithMutation);
