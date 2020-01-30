defmodule Recipeboard.Test.Accounts.User do
  use ExUnit.Case
  import Recipeboard.Factory

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Recipeboard.Repo)
  end

  test "user is built from factory" do
    user = insert(:user)

    assert user.name |> is_binary && !(is_nil(user.name)) 
    assert user.email |> is_binary && !(is_nil(user.email))
  end
end
