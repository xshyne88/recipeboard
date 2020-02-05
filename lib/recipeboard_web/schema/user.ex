defmodule RecipeboardWeb.Schema.User do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  connection(node_type: :user) do
    field(:count, non_null(:integer))

    edge do
    end
  end

  object :user do
    field(:id, non_null(:id))
    field(:email, non_null(:string))
    field(:admin, non_null(:boolean))
  end

  object :users_query do
    field(:user, :user) do
      resolve(fn _, _, _ -> {:ok, nil} end)
    end
  end

  # object :users_query do
  # connection field(:users, node_type: :user) do
  # resolve(fn _, _, _ -> {:ok, []} end)
  # end
  # end

  # connection(:user, node_type: :user) do
  # field(:count, non_null(:integer))

  # edge do
  # end
  # end
end
