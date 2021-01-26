defmodule Bookies.Bookmark do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookmarks" do
    field :description, :string
    field :hashed_url, :string
    field :private, :boolean, default: false
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(bookmark, attrs) do
    bookmark
    |> cast(attrs, [:title, :url, :hashed_url, :description, :private])
    |> validate_required([:title, :url, :hashed_url, :description, :private])
  end
end
