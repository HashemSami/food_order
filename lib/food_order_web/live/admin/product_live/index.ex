defmodule FoodOrderWeb.Admin.ProductLive.Index do
  use FoodOrderWeb, :live_view
  alias FoodOrder.Products

  def mount(_params, _session, socket) do
    products = Products.list_products()
    {:ok, assign(socket, products: products)}
  end
end