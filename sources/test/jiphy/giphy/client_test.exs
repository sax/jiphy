defmodule Jiphy.Giphy.ClientTest do
  use ExUnit.Case, async: true

  alias Jiphy.Giphy

  describe "get" do
    test "returns a webp version in the original size" do
      assert Giphy.Client.get("cats") == {:ok, "https://media2.giphy.com/media/a4WCILDLxigww/giphy.webp"}
    end

    test "returns a default image when the api limit is exceeded" do
      assert Giphy.Client.Client.get("api_limit") == {:error, "images/too-much-cat.png"}
    end
  end
end
