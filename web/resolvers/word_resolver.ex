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

  def quiz_word(%{quiz_id: quiz_id}, _info) do
    case WordRepo.quiz_word(quiz_id) do
      nil ->
        {:error, "All studied or you didn't add any word.'"}
      word ->
        {:ok, word}
    end
  end

  def mark_as_studied(%{quiz_id: quiz_id, word_id: word_id}, _info) do
    WordRepo.mark_as_studied(quiz_id, word_id)

    {:ok, %{id: word_id}}
  end

  def update_quiz_id(%{quiz_id: quiz_id, word_id: word_id}, _info) do
    WordRepo.update_quiz_id(quiz_id, word_id)

    {:ok, %{id: word_id}}
  end
end
