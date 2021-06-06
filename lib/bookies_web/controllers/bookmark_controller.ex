defmodule BookiesWeb.BookmarkController do
  use BookiesWeb, :controller
  alias Bookies.Bookmark
  alias Bookies.Repo

  def index(conn, _params) do
    bookmarks = Repo.all(Bookmark) |> Repo.preload([:user])
    render(conn, "index.html", bookmarks: bookmarks)
  end

  def edit(conn, %{"id" => id}) do
    bookmark = Repo.get!(Bookmark, id)
    changeset = Bookmark.changeset(bookmark)
    render(conn, "edit.html", bookmark: bookmark, changeset: changeset)
  end

  def new(conn, _params) do
    changeset =
      conn.assigns.current_user
      |> Ecto.build_assoc(:bookmarks)
      |> Bookmark.changeset(%{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bookmark" => bookmark_params}) do
    changeset =
      conn.assigns.current_user
      |> Ecto.build_assoc(:bookmarks)
      |> Bookmark.changeset(bookmark_params)

    case Repo.insert(changeset) do
      {:ok, _bookmark} ->
        conn
        |> put_flash(:info, "Bookmark successfully created.")
        |> redirect(to: Routes.bookmark_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
