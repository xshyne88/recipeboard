# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :recipeboard,
  ecto_repos: [Recipeboard.Repo]

# Configures the endpoint
config :recipeboard, RecipeboardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9TME5SQv+CaWT6lHHykJdl4u15tkyIK7q1pLjLexBdNZap3Fh8kpfu0zIgkcTM0f",
  render_errors: [view: RecipeboardWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Recipeboard.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    facebook:
      {Ueberauth.Strategy.Facebook,
       [
         display: "popup"
       ]}
  ]

config :recipeboard, RecipeboardWeb.Guardian,
  issuer: "recipeboard",
  # secret_key: System.get_env("SECRET_KEY_BASE") |> IO.inspect()
  secret_key: "8rGJlduQbjek/Vz7ZFAHz2vURwFp5dr16qoh+uV/sYVEmoPi2ugerfuoeZQ5x6tJ"

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_APP_ID"),
  client_secret: System.get_env("FACEBOOK_APP_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
