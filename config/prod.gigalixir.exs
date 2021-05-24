use Mix.Config

config :live_app, LiveAppWeb.Endpoint,
  # Without this line, your app will not start the web server!
  server: true,
  # Needed for Phoenix 1.3. Doesn't hurt for other versions
  load_from_system_env: true,
  # Needed for Phoenix 1.2 and 1.4. Doesn't hurt for 1.3.
  http: [port: {:system, "PORT"}],
  secret_key_base: "${SECRET_KEY_BASE}",
  url: [host: "${APP_NAME}.gigalixirapp.com", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json",
  # To bust cache during hot upgrades
  version: Mix.Project.config()[:version]

config :live_app, LiveApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "${DATABASE_URL}",
  # Works around a bug in older versions of ecto. Doesn't hurt for other versions.
  database: "",
  # PG_SSL=false for local db test
  ssl: String.to_atom(System.get_env("PG_SSL") || "true"),
  # ssl: true,
  # Free tier db only allows 4 connections. Rolling deploys need pool_size*(n+1) connections where n is the number of app replicas.
  pool_size: 2
