defmodule LiveApp.Repo.Migrations.AddPowEmailConfirmationToUsers do
  use Ecto.Migration

  def change do
    alter table(:pow_users) do
      add :email_confirmation_token, :string
      add :email_confirmed_at, :utc_datetime
      add :unconfirmed_email, :string
    end

    create unique_index(:pow_users, [:email_confirmation_token])
  end
end
