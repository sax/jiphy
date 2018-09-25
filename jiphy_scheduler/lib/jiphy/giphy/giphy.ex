defmodule Jiphy.Giphy do
  alias Jiphy.Giphy

  @default_image "images/too-much-cat.png"

  def get(term), do: Giphy.Store.get(term) |> with_default()

  def update(term) do
    Giphy.Client.get(term)
    |> save(term)
  end

  defp save({:ok, image}, term), do: Giphy.Store.put(term, image)
  defp with_default(nil), do: {:ok, @default_image}
  defp with_default(image), do: {:ok, image}
end
