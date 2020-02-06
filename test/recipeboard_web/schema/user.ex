defmodule RecipeboardWeb.Schema.UserTest do
  alias Recipeboard.Accounts.User
  use Wormwood.GQLCase

  use ExUnit.Case, async: true

  load_gql RecipeboardWeb.Schema, "assets/user.graphql"

  # test "users query" do
  #   testQuery("user.graphql") |> IO.inspect()
  # end

  test "create users mutation creates a new user" do
    input = %{}
    query_gql(variables: %{}, context: %{}) |> IO.inspect()
  end
end
