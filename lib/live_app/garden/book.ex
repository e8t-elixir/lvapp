defmodule LiveApp.Garden.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :info, :string
    field :isbn, :string
    field :title, :string
    field :view_count, :integer

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :info, :isbn, :view_count])
    |> validate_required([:title, :info, :isbn, :view_count])
  end
end
