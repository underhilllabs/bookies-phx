defmodule Bookies.Bookmarks do
  @moduledoc """
  The Bookmarks context.
  """

  import Ecto.Query, warn: false
  alias Bookies.Repo
  alias Bookies.Bookmarks.Bookmark
  def get_bookmark(id), do: Repo.get(Bookmark, id)

  def get_bookmark!(id), do: Repo.get!(Bookmark, id)

  def get_bookmarks do
    Repo.all(Bookmark)
  end
end
