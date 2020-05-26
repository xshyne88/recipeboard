defmodule Recipeboard.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :admin, :boolean, default: false, null: false

      add :name, :string
      add :email, :string
      add :image, :string

      add :provider, :string

      add :uid, :string
      add :remote_ip, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
