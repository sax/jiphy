defmodule Jiphy.Giphy do
  alias Jiphy.Giphy
  alias JiphyWeb.Endpoint

  require Logger

  @default_image "images/too-much-cat.png"

  def get(term), do: Giphy.Store.get(term) |> with_default()

  def update(term) do
    Giphy.Client.get(term)
    |> save(term)
    |> notify(term)
  end

  defp notify(image, term) do
    Endpoint.broadcast!("giphy:#{term}", "image", %{"src" => image})
    image
  end

  defp save({:ok, image}, term), do: Giphy.Store.put(term, image)
  defp save({:error, image}, _term), do: Logger.warn("Error retrieving image") && image
  defp with_default(nil), do: {:ok, @default_image}
  defp with_default(image), do: {:ok, image}
end
