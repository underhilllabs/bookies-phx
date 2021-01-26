defmodule Bookies.Repo.Migrations.CreateBookmarks do
  use Ecto.Migration

  def change do
    create table(:bookmarks) do
      add :title, :string
      add :url, :string
      add :hashed_url, :string
      add :description, :text
      add :private, :boolean, default: false, null: false

      timestamps()
    end

  end
end
