defmodule WordsWeb.Word do
  defstruct id: nil, user_id: nil, name: "", descriptions: []

  def init(id, attrs) do
    struct = %WordsWeb.Word{id: id}

    Enum.reduce Map.to_list(struct), struct, fn {k, _}, acc ->
      case Map.fetch(attrs, Atom.to_string(k)) do
        {:ok, v} -> %{acc | k => v}
        :error -> acc
      end
    end
  end
end
