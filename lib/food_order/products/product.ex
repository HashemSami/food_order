defmodule FoodOrder.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @sizes_values ~w/SMALL MEDIUM LARGE/a
  schema "products" do
    field :name, :string
    field :price, Money.Ecto.Composite.Type
    field :size, Ecto.Enum, values: @sizes_values, default: :SMALL
    field :description, :string
    field :image_url, :string, default: "product_1.jpg"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price, :size, :description, :image_url])
    |> validate_money(:price)
    |> validate_required([:name, :price, :size, :description])
  end

  defp validate_money(changeset, field) do
    validate_change(changeset, field, fn
      _, %Money{amount: amount} when amount > 0 -> []
      _, _ -> [amount: "must be greater than 0"]
    end)
  end
end
