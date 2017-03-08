import React from "react"

class Word extends React.Component {
  render() {
    const { word } = this.props;

    return (
      <div className="panel panel-default">
        <div className="panel-body">
          <h2>{ word.name }</h2>
        </div>

        <ul className="list-group">
          <li className="list-group-item">
            <h4>Description</h4>
            <ol>
              {
                word.descriptions.map((description) => (<li>{ description }</li>))
              }
            </ol>
          </li>
        </ul>
      </div>
    )
  }
}

export default Word;
