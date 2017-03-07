defmodule WordsWeb.Neo4j.ModelBuilder do
  alias Bolt.Sips.Types.Node
  alias WordsWeb.{Word, Idiom}

  @mapping %{"Word" => Word, "Idiom" => Idiom}

  def build(%Node{id: id, labels: [label], properties: props=%{}}) do
    init(label, id, props)
  end

  def build([sig: _, fields: model]) do
    build(model)
  end

  def build([id, [label], props = %{}]) do
    init(label, id, props)
  end

  defp init(model, id, attrs) do
    struct = struct(@mapping[model], %{id: id})

    Enum.reduce Map.to_list(struct), struct, fn {k, _}, acc ->
      case Map.fetch(attrs, Atom.to_string(k)) do
        {:ok, v} -> %{acc | k => v}
        :error -> acc
      end
    end
  end
end
