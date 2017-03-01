defmodule Quiz.Repo.Migrations.CreateWord do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :name, :string
      add :translation, :string
      add :example, :string

      timestamps()
    end

  end
end
