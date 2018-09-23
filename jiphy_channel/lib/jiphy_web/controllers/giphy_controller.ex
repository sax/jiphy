defmodule JiphyWeb.GiphyController do
  use JiphyWeb, :controller

  alias Jiphy.Giphy

  def index(conn, %{"tag" => tag}) do
    {:ok, image_url} = Giphy.get(tag)
    render(conn, "index.html", image_url: image_url, image_tag: tag)
  end

  def index(conn, _params) do
    conn |> index(%{"tag" => "cats"})
  end
end
