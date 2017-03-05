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
end
