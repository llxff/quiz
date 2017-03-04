import { createNetworkInterface } from "apollo-client"
import Settings from "../settings"

const networkInterface = createNetworkInterface({ uri: "/api" });

networkInterface.use([{
  applyMiddleware(req, next) {
    if (!req.options.headers) {
      req.options.headers = {};
    }

    const token = Settings.authToken();

    req.options.headers.authorization = token ? `Bearer ${ token }` : null;
    next();
  }
}]);

export default networkInterface;
