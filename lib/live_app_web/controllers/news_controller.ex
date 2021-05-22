defmodule LiveAppWeb.NewsController do
  use LiveAppWeb, :controller

  def index(conn, params) do
    render(conn, "index.html", params: params)
  end
end
