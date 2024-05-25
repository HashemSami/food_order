defmodule FoodOrder.ProductsTest do
  use FoodOrder.DataCase

  alias FoodOrder.Products

  describe "products" do
    alias FoodOrder.Products.Prodect

    import FoodOrder.ProductsFixtures

    @invalid_attrs %{name: nil, size: nil, description: nil, price: nil}

    test "list_products/0 returns all products" do
      prodect = prodect_fixture()
      assert Products.list_products() == [prodect]
    end

    test "get_prodect!/1 returns the prodect with given id" do
      prodect = prodect_fixture()
      assert Products.get_prodect!(prodect.id) == prodect
    end

    test "create_prodect/1 with valid data creates a prodect" do
      valid_attrs = %{name: "some name", size: "some size", description: "some description", price: 42}

      assert {:ok, %Prodect{} = prodect} = Products.create_prodect(valid_attrs)
      assert prodect.name == "some name"
      assert prodect.size == "some size"
      assert prodect.description == "some description"
      assert prodect.price == 42
    end

    test "create_prodect/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_prodect(@invalid_attrs)
    end

    test "update_prodect/2 with valid data updates the prodect" do
      prodect = prodect_fixture()
      update_attrs = %{name: "some updated name", size: "some updated size", description: "some updated description", price: 43}

      assert {:ok, %Prodect{} = prodect} = Products.update_prodect(prodect, update_attrs)
      assert prodect.name == "some updated name"
      assert prodect.size == "some updated size"
      assert prodect.description == "some updated description"
      assert prodect.price == 43
    end

    test "update_prodect/2 with invalid data returns error changeset" do
      prodect = prodect_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_prodect(prodect, @invalid_attrs)
      assert prodect == Products.get_prodect!(prodect.id)
    end

    test "delete_prodect/1 deletes the prodect" do
      prodect = prodect_fixture()
      assert {:ok, %Prodect{}} = Products.delete_prodect(prodect)
      assert_raise Ecto.NoResultsError, fn -> Products.get_prodect!(prodect.id) end
    end

    test "change_prodect/1 returns a prodect changeset" do
      prodect = prodect_fixture()
      assert %Ecto.Changeset{} = Products.change_prodect(prodect)
    end
  end
end
