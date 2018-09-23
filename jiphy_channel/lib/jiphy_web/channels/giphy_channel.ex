defmodule JiphyWeb.GiphyChannel do
  use JiphyWeb, :channel

  def join("giphy:" <> _search_term, _message, socket) do
    {:ok, socket}
  end
end
