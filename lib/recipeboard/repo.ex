defmodule Recipeboard.Repo do
  use Ecto.Repo,
    otp_app: :recipeboard,
    adapter: Ecto.Adapters.Postgres
end
