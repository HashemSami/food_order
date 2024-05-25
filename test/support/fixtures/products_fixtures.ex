defmodule FoodOrder.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodOrder.Products` context.
  """

  @doc """
  Generate a prodect.
  """
  def prodect_fixture(attrs \\ %{}) do
    {:ok, prodect} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: 42,
        size: "some size"
      })
      |> FoodOrder.Products.create_prodect()

    prodect
  end
end
