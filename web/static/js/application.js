import "phoenix_html";

import React              from "react";
import ReactDom           from "react-dom";
import Root               from "./containers/root";

const target = document.getElementById("application");
const node = <Root />;

ReactDom.render(node, target);
