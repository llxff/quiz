defmodule WordsWeb.WordResolver do
  alias WordsWeb.WordRepo

  def of_current_user(_args, %{context: %{current_user: %{id: user_id}}}) do
    {:ok, WordRepo.of_user(user_id)}
  end

  def word_web(%{id: id}, %{context: %{current_user: %{id: user_id}}}) do
    word_web = WordRepo.word_web(id, user_id)

    case word_web do
      %{"word": _} -> {:ok, word_web}
      %{} -> {:error, "Not found"}
    end

  end
end
