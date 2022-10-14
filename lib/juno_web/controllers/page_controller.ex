defmodule JunoWeb.PageController do
  use JunoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
