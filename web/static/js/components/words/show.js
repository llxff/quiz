import React from "react"

class Word extends React.Component {
  render() {
    const { word } = this.props;

    return <p>{ word.name }</p>
  }
}

export default Word;
