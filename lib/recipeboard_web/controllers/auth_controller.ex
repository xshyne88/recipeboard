defmodule RecipeboardWeb.AuthController do
  use RecipeboardWeb, :controller
  alias Ueberauth

  plug Ueberauth

  def callback(conn, params) do
    conn
    |> IO.inspect(label: "conn")
    |> scrub_oauth2()

    params
    # |> IO.inspect(label: "params")

    conn |> redirect(external: "/graphiql")
  end

  defp scrub_oauth2(%{assigns: %Auth{}, provider: provider, uid: uid}) do
    IO.inspect(provider, label: "provider: ")
    IO.inspect(uid, label: "provider: ")
  end
end
