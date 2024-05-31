defmodule FoodOrderWeb.Admin.ProductLive.Index do
  use FoodOrderWeb, :live_view
  alias FoodOrder.Products
  alias FoodOrder.Products.Product
  alias FoodOrderWeb.Admin.ProductLive.Form

  def mount(_params, _session, socket) do
    products = Products.list_products()
    {:ok, assign(socket, products: products)}
  end

  def handle_params(_unsigned_params, _uri, socket) do
    live_action = socket.assigns.live_action
    {:noreply, apply_action(socket, live_action)}
  end

  defp apply_action(socket, :new) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, %Product{})
  end

  defp apply_action(socket, :index) do
    socket |> assign(:page_title, "List Products")
  end
end
