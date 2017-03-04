defmodule WordsWeb.WordRepo do
  import Ecto.Query, only: [from: 2, limit: 2, offset: 2]

  alias WordsWeb.{Repo, Word}

  def all(), do: {:ok, Repo.all(Word) }

  def create(attributes) do
    %Word{}
    |> Word.changeset(attributes)
    |> Repo.insert
  end

  def quiz_word(quiz_id) do
    query = from w in Word, where: w.last_quiz_id != ^quiz_id and w.studied == false

    random_offset = query
      |> count
      |> random

    query
    |> offset(^random_offset)
    |> limit(1)
    |> Repo.all
    |> List.first
  end

  def mark_as_studied(quiz_id, word_id) do
    update(word_id, [last_quiz_id: quiz_id, studied: true])
  end

  def update_quiz_id(quiz_id, word_id) do
    update(word_id, [last_quiz_id: quiz_id])
  end

  defp count(query), do: Repo.aggregate(query, :count, :id)

  defp random(0), do: 0
  defp random(n), do: :rand.uniform(n) - 1

  defp update(word_id, fields) do
    from(w in Word, where: w.id == ^word_id)
    |> Repo.update_all(set: fields)
  end
end
