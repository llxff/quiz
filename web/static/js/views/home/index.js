import React from "react";
import WordsTable from "../../components/words/table"
import { Link } from "react-router";


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
