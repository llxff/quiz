defmodule WordsWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: WordsWeb.Repo

  object :user do
    field :id,    :id
    field :email, :string
  end

  object :session do
    field :token, :string
  end

  object :word do
    field :id,           :id
    field :name,         :string
    field :descriptions, list_of(:string)
  end

  object :idiom do
    field :id,           :id
    field :name,         :string
    field :descriptions, list_of(:string)
  end

  object :word_web do
    field :word,         :word
    field :idioms,       list_of(:idiom)
    field :associations, list_of(:word)
    field :synonyms,     list_of(:word)
    field :antonyms,     list_of(:word)
  end
end
