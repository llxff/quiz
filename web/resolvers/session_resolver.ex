defmodule WordsWeb.SessionResolver do
  alias WordsWeb.{Session, UserRepo}

  def current_user(_args, %{context: %{current_user: current_user}}) do
    {:ok, current_user}
  end
  def current_user(_args, _info), do: {:error, "Not authenticated"}

  def sign_in(%{email: email, password: password}, _info) do
    case Session.authenticate(email, password) do
      { :ok, user } ->
        { :ok, jwt, _full_claims } = user |> Guardian.encode_and_sign(:token)

        {:ok, %{token: jwt}}
      :error ->
        {:error, "Invalid credentials"}
    end
  end

  def sign_up(%{email: email, password: password}, _info) do
    case UserRepo.create(email, password) do
      { :ok, user } ->
        { :ok, jwt, _full_claims } = Guardian.encode_and_sign(user, :token)

        {:ok, %{token: jwt}}
      { :error, _changeset } ->
        {:error, "Invalid credentials"}
    end
  end
end
