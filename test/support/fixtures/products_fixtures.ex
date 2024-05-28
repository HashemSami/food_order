defmodule FoodOrder.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodOrder.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: %Money{amount: 43, currency: :SAR},
        size: "SMALL",
        image_url: "product_1.jpg"
      })
      |> FoodOrder.Products.create_product()

    product
  end
end
