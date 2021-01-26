defmodule Bookies.Repo.Migrations.AddTagsToBookmarks do
  use Ecto.Migration

  def change do
    alter table(:bookmarks) do
      add :tags, {:array, :string} 
    end
  end
end
