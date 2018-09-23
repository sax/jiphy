defmodule Jiphy.Test.HTTPoison do
  def get!(url) do
    case Regex.named_captures(~r/&tag=(?<tag>[^&]+)&/, url) do
      %{"tag" => tag} ->
        json = File.read!("test/fixtures/giphy/#{tag}.json")
        %HTTPoison.Response{body: json}

      other ->
        raise "Expected to get a URL with a tag param, got: #{inspect(other)}"
    end
  end
end
