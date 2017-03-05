defmodule WordsWeb.Schema do
  use Absinthe.Schema
  import_types WordsWeb.Schema.Types

  alias WordsWeb.{WordResolver, SessionResolver}

  query do
    field :current_user, :user do
      resolve &SessionResolver.current_user/2
    end

    field :words, list_of(:word) do
      resolve &WordResolver.of_current_user/2
    end
  end

  mutation do
    field :sign_in, type: :session do
      arg :email,    non_null(:string)
      arg :password, non_null(:string)

      resolve &SessionResolver.sign_in/2
    end

    field :sign_up, type: :session do
      arg :email,    non_null(:string)
      arg :password, non_null(:string)

      resolve &SessionResolver.sign_up/2
    end
  end
end
