defmodule Recipeboard.MixProject do
  use Mix.Project

  def project do
    [
      app: :recipeboard,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Recipeboard.Application, []},
      extra_applications: [:logger, :runtime_tools, :ueberauth_facebook]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:absinthe, ">= 1.4.0"},
      {:absinthe_phoenix, ">= 1.4.0"},
      {:absinthe_plug, ">= 1.4.0"},
      {:absinthe_relay, ">= 1.4.0"},
      {:argon2_elixir, "~> 2.0"},
      {:corsica, "~> 1.0"},
      {:credo, "1.1.0", only: [:dev, :test], runtime: false},
      {:dataloader, "~> 1.0.0"},
      {:ecto_sql, "~> 3.0"},
      {:ex_machina, "~> 2.3", only: :test},
      {:faker, "~> 0.13", only: :test},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.4.7"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 4.0.1"},
      {:postgrex, ">= 0.0.0"},
      {:ueberauth_facebook, "~> 0.8"},
      {:ueberauth, "~> 0.6.2"},
      {:wormwood, "~> 0.1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
