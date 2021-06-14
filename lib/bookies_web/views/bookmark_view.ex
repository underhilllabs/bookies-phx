defmodule BookiesWeb.BookmarkView do
  use BookiesWeb, :view

  def tag_str(%Bookies.Bookmark{tags: tags}) when tags == "", do: ""
  def tag_str(%Bookies.Bookmark{tags: tags}) do
    tags
    |> Enum.join(", ")
  end
end
