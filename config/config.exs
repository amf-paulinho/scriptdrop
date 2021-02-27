# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :scriptdrop,
  ecto_repos: [Scriptdrop.Repo]

# Configures the endpoint
config :scriptdrop, ScriptdropWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mjcqfshIHUYC8ysgOonuJb87LooB2+f+7ja0T36WOPB8DF7ctoAYupyt9JnbJNRF",
  render_errors: [view: ScriptdropWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Scriptdrop.PubSub,
  live_view: [signing_salt: "JHWz5OUp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [default_scope: "user:email"] }
  ]

  config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "ec004b11b68cb5f5d7c1",
  client_secret: "9e47e2f5b149f2ddfec680f7957976d8de7f4b17"
