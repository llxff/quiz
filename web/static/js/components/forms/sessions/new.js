import React from "react";
import { graphql } from "react-apollo";
import gql from "graphql-tag";
import { connect } from "react-redux";
import { routerActions } from "react-router-redux";
import { Link } from "react-router";

class SignInForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      email: "",
      password: "",
      error: ""
    };
  }

  render() {
    return (
      <div>
        <form>
          <div className="form-group">
            <h3>Вход</h3>
          </div>
          <div className="form-group">
            <p className="text-danger">{ this.state.error }</p>
          </div>
          <div className="form-group">
            <label htmlFor="emailInput">Почта</label>
            <input type="email"
                   className="form-control"
                   id="emailInput"
                   placeholder="email@example.com"
                   value={ this.state.email }
                   onChange={ ::this.handleChange("email") } />
          </div>
          <div className="form-group">
            <label htmlFor="passwordInput">Пароль</label>
            <input type="password"
                   className="form-control"
                   id="passwordInput"
                   placeholder="******"
                   value={ this.state.password }
                   onChange={ ::this.handleChange("password") } />
          </div>
          <a className="btn btn-success" onClick={ ::this.signIn }>Войти</a>
          <span> </span>
          <Link to="/sign_up">Зарегистрироваться</Link>
        </form>
      </div>
    )
  }

  handleChange(field) {
    return (event) => {
      this.setState({ [field]: event.target.value });
    }
  }

  signIn() {
    const { email, password } = this.state;

    this.props.mutate({ variables: { email: email, password: password }})
    .then(({ data: { sign_in: { token }} }) => {
      localStorage.setItem('token', token);
      ::this.props.dispatch(routerActions.push("/"))
    })
    .catch(() => {
      ::this.setState({ error: "Неверный логин или пароль" })
    })
  }
}

const mutation = gql`
  mutation SignIn($email: String!, $password: String!) {
    sign_in(email: $email, password: $password) {
      token
    }
  }
`;

const SignInFormWithMutation = graphql(mutation)(SignInForm);

export default connect((s) => (s))(SignInFormWithMutation);
