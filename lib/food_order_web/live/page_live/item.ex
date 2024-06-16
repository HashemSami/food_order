defmodule FoodOrderWeb.PageLive.Item do
  use FoodOrderWeb, :live_component

  def render(assigns) do
    ~H"""
    <div
      data-role="item"
      data-id={@id}
      class=" bg-[#EEEEEE] text-gray-900 shadow-lg rounded-lg p-4 mb-2 hover:bg-[#686D76] hover:text-white"
    >
      <img src={~p"/images/#{@product.image_url}"} alt="" class="h-40 mb-4 mx-auto" />
      <div class="text-center">
        <.product_details name={@product.name} size={@product.size} />
        <.product_info price={@product.price} />
      </div>
    </div>
    """
  end

  defp product_details(assigns) do
    ~H"""
    <h2 class="text-lg"><%= @name %></h2>

    <span class="bg-[#dd5d3e] py-1 px-4 rounded-full uppercase text-xs text-white">
      <%= @size %>
    </span>
    """
  end

  # dc8400 random
  defp product_info(assigns) do
    ~H"""
    <div class="mt-6 flex items-center justify-around">
      <span class="font-bold text-lg"><%= @price %></span>
      <button class="border-2 py-1 px-6 rounded-full border-blue-500 text-white transition hover:border-yellow-500 hover:bg-blue-500 hover:text-neutral-100">
        <span>+</span> <span>add</span>
      </button>
    </div>
    """
  end
end
