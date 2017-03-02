import { IndexRoute, Route } from "react-router";
import React from "react";
import MainLayout  from "../layouts/main";
import HomeIndexView from "../views/home";
import NewWordView from "../views/words/new";
import TestWordView from "../views/words/test";

export default (
  <Route component={ MainLayout }>
    <Route path="/" component={ HomeIndexView } />
    <Route path="/words/new" component={ NewWordView } />
    <Route path="/words/test" component={ TestWordView } />
  </Route>
);
