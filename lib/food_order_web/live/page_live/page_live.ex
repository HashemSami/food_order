defmodule FoodOrderWeb.PageLive do
  use FoodOrderWeb, :live_view
  # alias __MODULE__.Client
  alias FoodOrder.Products

  def mount(_params, _session, socket) do
    clients = [
      %{name: "hash", id: Ecto.UUID.generate(), value: 0},
      %{name: "hash2", id: Ecto.UUID.generate(), value: 0},
      %{name: "hash3", id: Ecto.UUID.generate(), value: 0}
    ]

    {:ok, assign(socket, clients: clients, products: Products.list_products())}
  end

  # def handle_event("add", %{"id" => id}, socket) do
  #   clients_update = fn clients ->
  #     Enum.map(clients, fn client ->
  #       if client.id == id do
  #         Map.update(client, :value, client.value, fn v -> v + 10 end)
  #       else
  #         client
  #       end
  #     end)
  #   end

  #   {:noreply, update(socket, :clients, clients_update)}
  # end
end
