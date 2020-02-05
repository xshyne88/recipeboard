defmodule RecipeboardWeb.Resolvers.User do
  alias Absinthe.Relay.Connection
  alias Recipeboard.Repo
  def get_users_connection(related, args, _) do
    related
    |> Recipeboard.Accounts.list_users(args)
    |> Connection.from_query(&Repo.all/1, args)
  end

  # def get_users_connection(_, _, _), do: {:error, :unauthorized}
end
