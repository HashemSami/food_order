defmodule FoodOrder.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :size, :string
    field :description, :string
    field :price, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price, :size, :description])
    |> validate_required([:name, :price, :size, :description])
  end
end
