defmodule WordsWeb.Router do
  use WordsWeb.Web, :router

  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: WordsWeb.Schema

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug WordsWeb.Web.Authentication
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug, schema: WordsWeb.Schema
  end

  scope "/", WordsWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end
end
