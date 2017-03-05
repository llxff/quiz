import React from "react";
import { Link } from "react-router";
import WordsTable from "../../components/words/table"

class HomeIndexView extends React.Component {
  render() {
    return (
      <div>
        <Link to="/words/new" className="btn btn-primary">Добавить</Link>
        <WordsTable />
      </div>
    )
  }
}

export default HomeIndexView;
