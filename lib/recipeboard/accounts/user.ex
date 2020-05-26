defmodule Recipeboard.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :name, :string
    field :image, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :admin, :image])
    |> validate_required([:email, :admin])
    |> unique_constraint(:email)
    |> encrypt_password()
  end

  defp from_conn(%{
         assigns: %{ueberauth_auth: %{info: %{email: email}, provider: provider, uid: uid} = auth}
       }) do
    %{email: email, provider: provider, uid: uid, admin: false}
    |> Recipeboard.Accounts.change_user()
  end

  defp encrypt_password(%{valid?: true, changes: %{password: pw}} = changeset) do
    put_change(changeset, :encrypted_password, Argon2.hash_pwd_salt(pw))
  end

  defp encrypt_password(changeset), do: changeset
end
