defmodule Bookies.Bookmark do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookmarks" do
    field :description, :string
    field :hashed_url, :string
    field :private, :boolean, default: false
    field :title, :string
    field :url, :string
    # field :tags , {:array, :string}
    field :tags, Bookies.Tags
    belongs_to :user, Bookies.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(bookmark, attrs \\ %{}) do
    bookmark
    |> cast(attrs, [:title, :url, :hashed_url, :description, :private, :tags])
    |> validate_required([:title, :url])
  end
end
