defmodule WordsWeb.WordResolver do
  alias WordsWeb.WordRepo

  def of_current_user(_args, %{context: %{current_user: %{id: user_id}}}) do
    {:ok, WordRepo.of_user(user_id)}
  end

  def word_web(%{id: id}, %{context: %{current_user: %{id: user_id}}}) do
    {:ok, WordRepo.word_web(id, user_id)}
  end
end
