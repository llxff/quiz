defmodule WordsWeb.UserRepo do
  alias WordsWeb.{Repo, User}

  def get_by_email(email) do
    Repo.get_by(User, email: String.downcase(email))
  end

  def create(email, password) do
    %User{}
    |> User.changeset(%{email: email, password: password})
    |> Repo.insert()
  end
end
