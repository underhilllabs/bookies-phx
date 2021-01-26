defmodule BookiesWeb.PageController do
  use BookiesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
