import React from "react";
import UUID from "../../utils/uuid"
import TestWords from "../../components/words/test"

class TestWordsView extends React.Component {
  render() {
    return <TestWords quiz_id={ new UUID().generate() } />
  }
}

export default TestWordsView;
