# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :words_web,
  ecto_repos: [WordsWeb.Repo]

# Configures the endpoint
config :words_web, WordsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iHYnMun8rO7CiqTCWBiRsU9H52cCgb2Jt2nAltUScInjQdkaBTY118f2RPUZ47IS",
  render_errors: [view: WordsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WordsWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
