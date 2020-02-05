defmodule RecipeboardWeb.Schema.UserTest do
  alias Recipeboard.Accounts.User

  use ExUnit.Case, async: true

  test "users query" do
    testQuery("user.graphql") |> IO.inspect()
  end

  text "create users mutation creates a new user" do
    input
    {:ok, result} = testQuery("create_user.graphql") |> IO.inspect()

    assert(expected == %User{
      email: "foo"
    })
  end
end
