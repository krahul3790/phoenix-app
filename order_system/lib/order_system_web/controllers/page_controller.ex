defmodule OrderSystemWeb.PageController do
  use OrderSystemWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
