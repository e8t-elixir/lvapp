defmodule LiveApp.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :likes_count, :integer, default: 0
    field :reposts_count, :integer, default: 0
    field :username, :string, default: "SuperStar"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body])
    |> validate_required([:body])
    |> validate_length(:body, min: 2, max: 140)

    # |> cast(attrs, [:username, :body, :likes_count, :reposts_count])
    # |> validate_required([:username, :body, :likes_count, :reposts_count])
  end
end
