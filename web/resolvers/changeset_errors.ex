defmodule WordsWeb.ChangesetErrors do
  def to_map(errors) do
    errors
    |> Enum.into(%{}, fn {field, { message, _}} -> {field, message} end)
  end
end
