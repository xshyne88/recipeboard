defmodule RecipeboardWeb.Schema do
  alias Recipeboard.{Accounts, Accounts.User}
  use Absinthe.Schema

  use Absinthe.Relay.Schema,
    flavor: :modern

  use RecipeboardWeb.NodeType

  import_types(Absinthe.Plug.Types)
  import_types(Absinthe.Type.Custom)
  import_types(__MODULE__.User)

  node interface do
    resolve_type(&resolve_node_type/2)
  end

  query do
    import_fields(:users_query)
  end

  mutation do
  end

  subscription do
  end

  def context(ctx) do
    loader =
      Dataloader.new
      |> Dataloader.add_source(User, Accounts.query_data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
