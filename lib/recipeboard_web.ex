defmodule RecipeboardWeb do
  def controller do
    quote do
      use Phoenix.Controller, namespace: RecipeboardWeb

      import Plug.Conn
      import RecipeboardWeb.Gettext
      alias RecipeboardWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/recipeboard_web/templates",
        namespace: RecipeboardWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      import RecipeboardWeb.ErrorHelpers
      import RecipeboardWeb.Gettext
      alias RecipeboardWeb.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import RecipeboardWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
