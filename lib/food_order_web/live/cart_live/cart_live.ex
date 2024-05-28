defmodule FoodOrderWeb.CartLive do
  use FoodOrderWeb, :live_view
  alias __MODULE__.Details

  def mount(_params, _session, socket) do
    {:ok, assign(socket, total_qty: Enum.random([0, 1]))}
  end

  defp empty_cart(assigns) do
    ~H"""
    <dev class="py-16 container mx-auto text-center">
      <h1 class="text-3xl font-bold mb-2">Your Cart is empty!</h1>
      
      <p class="text-neutral-500 text-lg mb-12">
        You probably haven't ordered any food yet. <br /> To order good food, go to the main page.
      </p>
       <.icon name="hero-shopping-bag-solid" class="w-20 h-20 mx-auto text-orange-500 block" />
      <a
        href={~p"/"}
        class="inline-block px-6 py-2 bg-blue-500 rounded-full text-white font-bold mt-12"
      >
        Go back
      </a>
    </dev>
    """
  end
end
