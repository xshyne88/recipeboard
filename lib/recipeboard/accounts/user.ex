defmodule Recipeboard.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :admin])
    |> validate_required([:name, :email, :admin])
    |> unique_constraint(:email)
    |> encrypt_and_put_password()
  end

  defp encrypt_and_put_password(%{valid?: true, changes: %{password: pw}} = changeset) do
    put_change(changeset, :encrypted_password, Argon2.has_pwd_salt(pw))
  end

  defp encrypt_and_put_password(changeset), do: changeset
end
