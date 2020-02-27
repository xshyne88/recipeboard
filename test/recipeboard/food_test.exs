defmodule Recipeboard.FoodTest do
  use Recipeboard.DataCase

  alias Recipeboard.Food

  describe "ingredients" do
    alias Recipeboard.Food.Ingredient

    @valid_attrs %{amount: 42, name: "some name", unit: "some unit"}
    @update_attrs %{amount: 43, name: "some updated name", unit: "some updated unit"}
    @invalid_attrs %{amount: nil, name: nil, unit: nil}

    def ingredient_fixture(attrs \\ %{}) do
      {:ok, ingredient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Food.create_ingredient()

      ingredient
    end

    test "list_ingredients/0 returns all ingredients" do
      ingredient = ingredient_fixture()
      assert Food.list_ingredients() == [ingredient]
    end

    test "get_ingredient!/1 returns the ingredient with given id" do
      ingredient = ingredient_fixture()
      assert Food.get_ingredient!(ingredient.id) == ingredient
    end

    test "create_ingredient/1 with valid data creates a ingredient" do
      assert {:ok, %Ingredient{} = ingredient} = Food.create_ingredient(@valid_attrs)
      assert ingredient.amount == 42
      assert ingredient.name == "some name"
      assert ingredient.unit == "some unit"
    end

    test "create_ingredient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Food.create_ingredient(@invalid_attrs)
    end

    test "update_ingredient/2 with valid data updates the ingredient" do
      ingredient = ingredient_fixture()
      assert {:ok, %Ingredient{} = ingredient} = Food.update_ingredient(ingredient, @update_attrs)
      assert ingredient.amount == 43
      assert ingredient.name == "some updated name"
      assert ingredient.unit == "some updated unit"
    end

    test "update_ingredient/2 with invalid data returns error changeset" do
      ingredient = ingredient_fixture()
      assert {:error, %Ecto.Changeset{}} = Food.update_ingredient(ingredient, @invalid_attrs)
      assert ingredient == Food.get_ingredient!(ingredient.id)
    end

    test "delete_ingredient/1 deletes the ingredient" do
      ingredient = ingredient_fixture()
      assert {:ok, %Ingredient{}} = Food.delete_ingredient(ingredient)
      assert_raise Ecto.NoResultsError, fn -> Food.get_ingredient!(ingredient.id) end
    end

    test "change_ingredient/1 returns a ingredient changeset" do
      ingredient = ingredient_fixture()
      assert %Ecto.Changeset{} = Food.change_ingredient(ingredient)
    end
  end
end
