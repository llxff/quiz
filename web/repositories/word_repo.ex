defmodule WordsWeb.WordRepo do
  alias WordsWeb.Neo4j.ModelBuilder

  import Bolt.Sips, only: [conn: 0, query: 3]

  def of_user(user_id) do
    query = "match (n:Word)-[:ASSOCIATION]->(:Word) where n.user_id = {user_id} return distinct(n)"

    conn()
    |> query(query, %{user_id: user_id})
    |> build_words()
  end

  defp build_words({:ok, rows}) do
    rows
    |> Stream.map(&(&1["n"]))
    |> Stream.map(&ModelBuilder.build/1)
    |> Enum.to_list
  end
  defp build_words({:error, _}), do: []

  def word_web(id, user_id) do
    query = """
      match (w:Word)-[:SOURCE]->(idiom:Idiom)
      where ID(w)={id} and w.user_id={user_id}
        with w, collect(idiom) as idioms
      match (w)-[:ASSOCIATION]->(assoc:Word)-[:EXAMPLE]->(ex:Word)
        with w, idioms, assoc, collect(ex) as examples
        with w, idioms, collect({subject: assoc, examples: examples}) as associations
      match (w)-[:SYNONYM]->(syn:Word)-[:EXAMPLE]->(ex:Word)
        with w, idioms, associations, syn, collect(ex) as examples
        with w, idioms, associations, collect({subject: syn, examples: examples}) as synonyms
      match (w)-[:ANTONYM]->(ant:Word)-[:EXAMPLE]->(ex:Word)
        with w, idioms, associations, synonyms, ant, collect(ex) as examples
        with w, idioms, associations, synonyms, collect({subject: ant, examples: examples}) as antonyms
      return w, idioms, associations, synonyms, antonyms
    """

    conn()
    |> query(query, %{id: id, user_id: user_id})
    |> build_word_web()
  end

  defp build_word_web({:ok, [row]}) do
    %{
      "word": ModelBuilder.build(row["w"]),
      "idioms": Enum.map(row["idioms"], &ModelBuilder.build/1),
      "associations": Enum.map(row["associations"], &associaion/1),
      "synonyms": Enum.map(row["synonyms"], &associaion/1),
      "antonyms": Enum.map(row["antonyms"], &associaion/1)
    }
  end
  defp build_word_web({:ok, []}), do: %{}
  defp build_word_web({:error, _}), do: %{}

  defp associaion(row) do
    model = ModelBuilder.build(row["subject"][:fields])
    examples_models = Enum.map(row["examples"], &ModelBuilder.build/1)

    %{"subject": model, "examples": examples_models}
  end
end
