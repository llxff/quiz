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
    field :id,          :id
    field :name,        :string
    field :translation, :string
    field :example,     :string
  end

  object :word_errors do
    field :name,        :string
    field :translation, :string
    field :example,     :string
  end

  object :create_word_response do
    field :word,   :word
    field :errors, :word_errors
  end
end
