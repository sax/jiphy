use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :jiphy, JiphyWeb.Endpoint,
  http: [port: 4001],
  server: false

config :jiphy, :httpoison, Jiphy.Test.HTTPoison

# Print only warnings and errors during test
config :logger, level: :warn
