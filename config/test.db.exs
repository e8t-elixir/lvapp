use Mix.Config

# Configure your database
config :live_app, LiveApp.Repo,
  username: "dev",
  password: "xubuntudb",
  database: "live_app_test",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
