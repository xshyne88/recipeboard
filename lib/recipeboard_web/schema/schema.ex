defmodule RecipeboardWeb.Schema do
  use Absinthe.Schema

  use Absinthe.Relay.Schema, flavor: :modern
  use Absinthe.Relay.Schema.Notation, :modern

  import_types(RecipeboardWeb.Schema.User)

  query do
    import_fields(:user_queries)
  end

  mutation do
    import_fields(:user_mutations)
  end

  subscription do
  end

  node interface do
    resolve_type(fn
      %Recipeboard.Accounts.User{}, _ ->
        :user

      _, _ ->
        nil
    end)
  end
end
