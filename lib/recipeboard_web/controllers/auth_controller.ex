defmodule RecipeboardWeb.AuthController do
  use RecipeboardWeb, :controller
  plug Ueberauth

  def callback(conn, params) do
    conn
    |> IO.inspect(label: "conn")

    params
    |> IO.inspect(label: "params")
  end
end
