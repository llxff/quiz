defmodule Quiz.Repo.Migrations.AddQuiz do
  use Ecto.Migration

  def change do
    alter table(:words) do
      add :last_quiz_id, :string, default: ""
      add :studied, :boolean, default: false
    end

    create index(:words, [:last_quiz_id, :studied])
  end
end
