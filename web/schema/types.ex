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

  object :meaning do
    field :subject, :word
    field :examples, list_of(:word)
  end

  object :word_web do
    field :word,         :word
    field :idioms,       list_of(:idiom)
    field :associations, list_of(:meaning)
    field :synonyms,     list_of(:meaning)
    field :antonyms,     list_of(:meaning)
  end
end
