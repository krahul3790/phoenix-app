defmodule OrderSystemWeb.HelloController do 
  use OrderSystemWeb, :controller

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: messenger)
  end

  def index(conn, _params) do 
    render(conn, "index.html")
  end
end
