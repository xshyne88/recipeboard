defmodule RecipeboardWeb.Router do
  use RecipeboardWeb, :router
  require Absinthe.Plug

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through [:api]

    forward "/", Absinthe.Plug, schema: MyAppWeb.Schema
  end

  scope "/graphiql" do
    pipe_through([:api])

    forward(
      "/",
      Absinthe.Plug.GraphiQL,
      schema: RecipeboardWeb.Schema,
      json_codec: Jason,
      interface: :playground,
      socket: RecipeboardWeb.UserSocket
    )
  end
end
