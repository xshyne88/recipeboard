defmodule RecipeboardWeb.Schema.UserTest do
  alias Recipeboard.Accounts.User
  use RLoader

  use ExUnit.Case, async: true

  test "users query" do
    testQuery("user.graphql") |> IO.inspect()
  end
end
