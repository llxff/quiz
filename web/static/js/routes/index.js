import { IndexRoute, Route } from "react-router";
import React from "react";
import MainLayout  from "../layouts/main";
import SessionsNew from "../views/sessions/new"
import RegistrationsNew from "../views/registrations/new"
import AuthenticatedContainer from "../containers/authenticated"
import HomeIndexView from "../views/home";
import NewWordView from "../views/words/new"
import WordWeb from "../views/words/show"

export default (
  <Route component={ MainLayout }>
    <Route path="/sign_in" component={ SessionsNew } />
    <Route path="/sign_up" component={ RegistrationsNew } />

    <Route path="/" component={ AuthenticatedContainer }>
      <IndexRoute component={ HomeIndexView } />

      <Route path="/words/new" component={ NewWordView } />
      <Route path="/words/:id" component={ WordWeb } />
    </Route>
  </Route>
);
