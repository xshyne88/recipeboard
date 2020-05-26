defmodule Recipeboard.Accounts do
  import Ecto.Query, warn: false
  alias Ecto.Multi
  alias Recipeboard.Repo
  alias Recipeboard.Accounts.User
  alias RecipeboardWeb.Guardian

  def register(%{provider: :facebook} = params) do
    with {:ok, %{upserted_user: %{email: email, image: image}}} <- upsert_user(params, tx: true),
         {:ok, token, _claims} <- Guardian.encode_and_sign(%{email: email, image: image}) do
      {:ok, token}
    else
      {:error, _} = tuple_error -> tuple_error
      err -> {:error, err}
    end
  end

  def register(_), do: {:error, "check register oauth function, something went wrong"}

  def query_data() do
    Dataloader.Ecto.new(Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

  def list_users(_, _) do
    User
  end

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def upsert_user(params, tx: true) do
    Multi.new()
    |> Multi.run(:upserted_user, fn _, _ -> upsert_user(params) end)
    |> Repo.transaction()
  end

  def upsert_user(%{email: email} = params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert(on_conflict: :nothing)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
