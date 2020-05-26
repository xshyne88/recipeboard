defmodule RecipeboardWeb.AuthController do
  use RecipeboardWeb, :controller
  alias Recipeboard.Accounts
  alias Ueberauth

  plug Ueberauth

  def callback(conn, params) do
    conn
    |> get_oauth_params()

    conn |> redirect(to: "/")
  end

  defp get_oauth_params(%{
         assigns: %{
           ueberauth_auth: %{
             info: %{
               email: email,
               image: image},
               provider: provider,
               uid: uid}
         }
       }) do
    Accounts.register(%{email: email, provider: provider, uid: uid, image: image})
  end

  # defp scrub_oauth2(e), do: IO.inspect(e)
end
