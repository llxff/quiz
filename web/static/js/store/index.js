import {
  createStore,
  applyMiddleware,
  combineReducers,
  compose
} from "redux";

import { routerMiddleware } from 'react-router-redux';
import createLogger         from 'redux-logger';
import thunkMiddleware      from 'redux-thunk';
import reducers             from '../reducers';

const loggerMiddleware = createLogger({
  level: 'info',
  collapsed: true,
});

export default function configureStore(apolloClient, browserHistory) {
  const reduxRouterMiddleware = routerMiddleware(browserHistory);

  return createStore(
    combineReducers({ ...reducers, apollo: apolloClient.reducer() }),
    {},
    compose(
      applyMiddleware(
        reduxRouterMiddleware,
        thunkMiddleware,
        loggerMiddleware,
        apolloClient.middleware()
      )
    )
  )
}
