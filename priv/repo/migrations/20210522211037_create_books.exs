defmodule LiveApp.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :info, :text
      add :isbn, :string
      add :view_count, :integer

      timestamps()
    end

  end
end
