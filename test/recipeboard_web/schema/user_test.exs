defmodule RecipeboardWeb.Schema.UserTest do
  alias Recipeboard.Accounts.User

  use ExUnit.Case, async: true
  import Recipeboard.Runner

  @query """
  mutation CreateUser($input: UserInput!) {
    createUser(input: $input) {
      edge {
        node {
          email
        }
      }
    }
  }
  """

  test "create users mutation creates a new user" do
    input = %{
      "name" => "chase",
      "email" => "foo@bar.com",
      "admin" => false
    }

    test_query(@query, variables: %{"input" => input})
  end
end
