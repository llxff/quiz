defmodule Quiz.Schema do
  use Absinthe.Schema
  import_types Quiz.Schema.Types

  alias Quiz.WordResolver

  query do
    field :words, list_of(:word) do
      resolve &WordResolver.all/2
    end
  end

  mutation do
    field :create_word, type: :create_word_response do
      arg :name,        non_null(:string)
      arg :translation, non_null(:string)
      arg :example,     non_null(:string)

      resolve &WordResolver.create/2
    end
  end
end
