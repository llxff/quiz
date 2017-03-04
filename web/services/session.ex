defmodule WordsWeb.Session do
  alias WordsWeb.UserRepo

  def authenticate(email, password) do
    user = UserRepo.get_by_email(email)

    case check_password(user, password) do
      true -> { :ok, user }
      _ -> :error
    end
  end

  defp check_password(nil, _password), do: false
  defp check_password(user, password) do
    IO.puts password
    IO.puts user.encrypted_password
    Comeonin.Bcrypt.checkpw(password, user.encrypted_password)
  end
end
