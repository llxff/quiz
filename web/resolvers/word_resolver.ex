defmodule Quiz.WordResolver do
  alias Quiz.{WordRepo, ChangesetErrors}

  def all(_args, _info), do: WordRepo.all()

  def create(args, _info) do
    case WordRepo.create(args) do
      {:ok, word} ->
        {:ok, %{word: word}}
      {:error, changeset} ->
        {:ok, %{errors: ChangesetErrors.to_map(changeset.errors)}}
    end
  end
end
