defmodule FoodOrderWeb.PageLive.Client do
  use FoodOrderWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <%= self() |> :erlang.pid_to_list() %> <span><%= @client.id %></span>
      <span><%= @client.name %></span> <span><%= @client.value %></span>
      <button phx-click="add" phx-target={@myself}>Add</button>
    </div>
    """
  end

  def handle_event("add", _, socket) do
    {:noreply,
     update(socket, :client, fn client ->
       Map.update(client, :value, client.value, fn v -> v + 10 end)
     end)}
  end
end
