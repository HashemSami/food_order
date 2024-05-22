defmodule FoodOrderWeb.PageLive do
  use FoodOrderWeb, :live_view

  def mount(params, _session, socket) do
    IO.inspect(params)
    {:ok, assign(socket, name: params["name"], id: Ecto.UUID.generate(), value: 0)}
  end

  def render(assigns) do
    # IO.inspect(assigns.socket.assigns, label: "assigns")

    ~H"""
    <div>
      <span><%= @id %></span> <span><%= @name %></span> <span><%= @value %></span>
      <button phx-click="add">Add</button>
    </div>
    """
  end

  def handle_event("add", unsigned_params, socket) do
    IO.inspect(unsigned_params)
    {:noreply, update(socket, :value, fn v -> v + 10 end)}
  end
end
