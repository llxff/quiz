defmodule WordsWeb.WordResolver do
  alias WordsWeb.WordRepo

  def of_current_user(_args, %{context: %{current_user: %{id: user_id}}}) do
    {:ok, WordRepo.of_user(user_id)}
  end
end
