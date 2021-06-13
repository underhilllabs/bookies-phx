defmodule Bookies.Bookmarks do
  @moduledoc """
  The Bookmarks context.
  """

  import Ecto.Query, warn: false
  alias Bookies.Repo
  alias Bookies.Tags
  alias Bookies.Bookmarks.Bookmark
  def get_bookmark(id), do: Repo.get(Bookmark, id)

  def get_bookmark!(id), do: Repo.get!(Bookmark, id)

  def get_bookmarks do
    Repo.all(Bookmark)
  end

  def get_bookmark_by(params) do
    Repo.get_by(Bookmark, params)
  end

  def get_bookmark_by_tag(tag) do
    Repo.all(from b in Bookmark, where: ^"#{tag}" in b.tags)
  end
end
