defmodule FoodOrder.Products do
  @moduledoc """
  The Products context.
  """

  import Ecto.Query, warn: false
  alias FoodOrder.Repo

  alias FoodOrder.Products.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single Product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_Product!(123)
      %Product{}

      iex> get_Product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_Product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a Product.

  ## Examples

      iex> create_Product(%{field: value})
      {:ok, %Product{}}

      iex> create_Product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_Product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a Product.

  ## Examples

      iex> update_Product(Product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_Product(Product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_Product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Product.

  ## Examples

      iex> delete_Product(Product)
      {:ok, %Product{}}

      iex> delete_Product(Product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_Product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking Product changes.

  ## Examples

      iex> change_Product(Product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_Product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end
end
