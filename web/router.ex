defmodule Quiz.Router do
  use Quiz.Web, :router

  forward "/api", Absinthe.Plug, schema: Quiz.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Quiz.Schema

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Quiz do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
end
