defmodule RecipeboardWeb.Router do
  use RecipeboardWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RecipeboardWeb do
    pipe_through :api
  end
end
