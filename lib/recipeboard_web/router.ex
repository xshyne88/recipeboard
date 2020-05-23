defmodule RecipeboardWeb.Router do
  use RecipeboardWeb, :router
  require Absinthe.Plug

  pipeline :api do
    plug :accepts, ["json"]
  end

  # pipeline :browser do
  # plug RecipeboardWeb.Auth
  # end

  scope "/api" do
    pipe_through [:api]

    forward "/", Absinthe.Plug, schema: RecipeboardWeb.Schema
  end

  scope "/auth", RecipeboardWeb do
    # pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
    post "/logout", AuthController, :delete
  end

  scope "/graphiql" do
    pipe_through([:api])

    forward(
      "/",
      Absinthe.Plug.GraphiQL,
      schema: RecipeboardWeb.Schema
      # json_codec: Jason,
      # interface: :playground,
      # socket: RecipeboardWeb.UserSocket
    )
  end
end
