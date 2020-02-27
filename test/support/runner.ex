defmodule Recipeboard.Runner do
  def test_query(query, opts \\ []) do
    variables = Keyword.get(opts, :variables, %{})
    context = Keyword.get(opts, :context, %{})

    Absinthe.run(query, RecipeboardWeb.Schema, variables: variables, context: context)
  end
end
