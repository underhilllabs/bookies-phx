defmodule BookiesWeb.BookmarkView do
  use BookiesWeb, :view

  def tag_list(%Bookies.Bookmark{tags: tags}) do
    tags || []
    |> Enum.join(", ")
  end
end
