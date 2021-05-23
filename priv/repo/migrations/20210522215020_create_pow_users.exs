defmodule LiveApp.Repo.Migrations.CreatePowUsers do
  use Ecto.Migration

  def change do
    # create table(:users) do
    create table(:pow_users) do
      add :email, :string, null: false
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:pow_users, [:email])
  end
end
