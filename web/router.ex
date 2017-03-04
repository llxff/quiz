defmodule WordsWeb.Router do
  use WordsWeb.Web, :router

  forward "/api", Absinthe.Plug, schema: WordsWeb.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: WordsWeb.Schema

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", WordsWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end
end
