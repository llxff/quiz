defmodule WordsWeb.Schema do
  use Absinthe.Schema
  import_types WordsWeb.Schema.Types

  alias WordsWeb.WordResolver

  query do
    field :words, list_of(:word) do
      resolve &WordResolver.all/2
    end

    field :quiz_word, type: :word do
      arg :quiz_id, non_null(:string)

      resolve &WordResolver.quiz_word/2
    end
  end

  mutation do
    field :create_word, type: :create_word_response do
      arg :name,        non_null(:string)
      arg :translation, non_null(:string)
      arg :example,     non_null(:string)

      resolve &WordResolver.create/2
    end

    field :mark_as_studied, type: :word do
      arg :quiz_id, non_null(:string)
      arg :word_id, non_null(:integer)

      resolve &WordResolver.mark_as_studied/2
    end

    field :update_quiz_id, type: :word do
      arg :quiz_id, non_null(:string)
      arg :word_id, non_null(:integer)

      resolve &WordResolver.update_quiz_id/2
    end
  end
end
