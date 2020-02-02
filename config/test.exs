use Mix.Config

# Configure your database
config :recipeboard, Recipeboard.Repo,
  username: "chase",
  password: "abc123",
  database: "recipeboard_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
  
if System.get_env("GITHUB_ACTIONS") do
  config :app, App.Repo,
    username: "postgres",
    password: "postgres"
end

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :recipeboard, RecipeboardWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
