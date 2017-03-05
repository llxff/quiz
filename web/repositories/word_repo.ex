defmodule WordsWeb.WordRepo do
  alias WordsWeb.Word

  import Bolt.Sips, only: [conn: 0, query: 3]

  def of_user(user_id) do
    query = "match (n:Word)-[:ASSOCIATION]->(:Word) where n.user_id = {user_id} return distinct(n)"

    conn()
    |> query(query, %{user_id: user_id})
    |> build_list()
  end

  defp build_list({:ok, rows}) do
    rows
    |> Stream.map(&(&1["n"]))
    |> Stream.map(&build_word/1)
    |> Enum.to_list
  end
  defp build_list({:error, _}), do: []

  defp build_word(%Bolt.Sips.Types.Node{id: id, properties: properties}) do
    Word.init(id, properties)
  end
end
