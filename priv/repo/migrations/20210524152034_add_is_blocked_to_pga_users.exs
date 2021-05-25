defmodule LiveApp.Repo.Migrations.AddIsBlockedToUsers do
  use Ecto.Migration

  def change do
    alter table(:pga_users) do
      add_if_not_exists(:is_blocked, :boolean, default: false)
    end
  end
end
