# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

app = :live_app

config :live_app,
  ecto_repos: [LiveApp.Repo]

# Configures the endpoint
config :live_app, LiveAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PU/nhF2SKGWB1wzh+405vzhIbhEpZUDkXOgqT1hoQnfK0WHYTYwhfvYcMjyY38Yu",
  render_errors: [view: LiveAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveApp.PubSub,
  live_view: [signing_salt: "ekIPo+xF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Pow 

config app, :pow,
  user: LiveApp.Users.User,
  repo: LiveApp.Repo,
  web_module: LiveAppWeb,
  # add cookie session
  extensions: [PowPersistentSession, PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: LiveAppWeb.Pow.Mailer,
  routes_backend: LiveAppWeb.Pow.Routes,
  messages_backend: LiveAppWeb.Pow.Messages

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
