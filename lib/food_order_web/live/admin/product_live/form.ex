defmodule FoodOrderWeb.Admin.ProductLive.Form do
  use FoodOrderWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <.simple_form for={@product} phx-change="validate" phx-submit="save">
        <.input field={@product[:name]} label="Name" />
        <.input field={@product[:price]} label="Price" />
        <.input field={@product[:size]} label="Size" />
        <:actions>
          <.button>Save</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end
end
