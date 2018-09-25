defmodule Jiphy.Giphy.Client do
  @api_key Application.get_env(:jiphy, :giphy_api_key)
  @httpoison Application.get_env(:jiphy, :httpoison)

  def get(search) do
    search
    |> search_url()
    |> @httpoison.get!(Accept: "application/json")
    |> Map.get(:body)
    |> Poison.decode!()
    |> image()
  end

  defp search_url(search, api_key \\ @api_key) do
    "https://api.giphy.com/v1/gifs/random?api_key=#{api_key}&tag=#{search}&rating=G"
  end

  defp image(%{"message" => "API rate limit exceeded"}), do: {:error, "images/too-much-cat.png"} |> IO.inspect()
  defp image(%{"data" => data}), do: {:ok, get_in(data, ["images", "original", "webp"])}
end
