defmodule RecipeboardWeb.Resolvers.User do
  alias Absinthe.Relay.Connection
  alias Recipeboard.Repo

  def get_users_connection(related, args, _) do
    related
    |> Recipeboard.Accounts.list_users(args)
    |> Connection.from_query(&Repo.all/1, args)
  end

  @spec create_user(
          any,
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any},
          any
        ) :: any
  def create_user(_, args, _) do
    Recipeboard.Accounts.create_user(args)
  end

  # def get_users_connection(_, _, _), do: {:error, :unauthorized}
end
