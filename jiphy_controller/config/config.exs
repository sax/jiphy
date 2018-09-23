# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :jiphy, JiphyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iIy9t5FZVa9PLRd+cOtUyeFEt4Nf0uyZRxp1R47Tv2Cpxz9iLiFgRKWnmnlwzR28",
  render_errors: [view: JiphyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Jiphy.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :jiphy, :giphy_api_key, System.get_env("GIPHY_API_KEY")
config :jiphy, :httpoison, HTTPoison

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
