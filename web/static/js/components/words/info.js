import React from "react";

class WordInfo extends React.Component {
  render() {
    const { word } = this.props;

    return (
      <blockquote>
        <p><i>{ word.name }</i> - { word.translation }</p>
        <footer>{ word.example }</footer>
      </blockquote>
    )
  }
}

export default WordInfo;
