defmodule Quiz.WordRepo do
  alias Quiz.{Repo, Word}

  def all(), do: {:ok, Repo.all(Word) }

  def create(attributes) do
    %Word{}
    |> Word.changeset(attributes)
    |> Repo.insert
  end
end
