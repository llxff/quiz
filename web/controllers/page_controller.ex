defmodule Quiz.PageController do
  use Quiz.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
