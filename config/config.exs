# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :barber_shop,
  ecto_repos: [BarberShop.Repo]

# Configures the endpoint
config :barber_shop, BarberShopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Aob6tXo3H+4kPOXxhk0cYYUd2vVKT1KwTJCOLD2O5aastjB9Xz1Ci7KQ2CGWF/s6",
  render_errors: [view: BarberShopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BarberShop.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "O8YukTcL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
