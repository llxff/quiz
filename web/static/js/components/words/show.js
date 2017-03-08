import React from "react"

class Word extends React.Component {
  render() {
    const { word_web: { word, associations, synonyms, antonyms, idioms } } = this.props;

    return (
      <div className="panel panel-default">
        <div className="panel-heading">
          <b>{ word.name }</b>
        </div>
        <ul className="list-group">
          <li className="list-group-item">
            <h4>Description</h4>
            <ol>
              {
                word.descriptions.map((description, i) => (<li key={ i }>{ description }</li>))
              }
            </ol>
          </li>
          { ::this.renderMeaning("Associations", associations) }
          { ::this.renderMeaning("Synonyms", synonyms) }
          { ::this.renderMeaning("Antonyms", antonyms) }
          <li className="list-group-item">
            <h4>Idioms</h4>
            <ol>
              {
                idioms.map((idiom) => {
                  return (
                    <li key={ idiom.id }>
                      { idiom.name }
                      <ol>
                        { idiom.descriptions.map((desc, i) => (<li key={ i }>{ desc }</li>))}
                      </ol>
                    </li>
                  )
                })
              }
            </ol>
          </li>
        </ul>
      </div>
    )
  }

  renderMeaning(name, meanings) {
    return (
      <li className="list-group-item">
        <h4>{ name }</h4>
        <ol>
          {
            meanings.map(({ subject, examples }) => {
              return (
                <li key={ subject.id }>
                  { subject.name }
                  <ol>
                    { examples.map((example, i) => (<li key={ i }>{ example.name }</li>))}
                  </ol>
                </li>
              )
            })
          }
        </ol>
      </li>
    )
  }
}

export default Word;
