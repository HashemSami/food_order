defmodule FoodOrderWeb.Admin.ProductLive.Form do
  alias FoodOrder.Products.Product
  alias FoodOrder.Products
  use FoodOrderWeb, :live_component

  def update(%{product: product} = assigns, socket) do
    changeset = Products.change_product(product)
    {:ok, socket |> assign(assigns) |> assign(form: to_form(changeset))}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.simple_form
        for={@form}
        id="product-form"
        phx-change="validate"
        phx-submit="save"
        phx-target={@myself}
      >
        <.input field={@form[:name]} label="Name" />
        <.input field={@form[:description]} type="textarea" label="Description" />
        <.input field={@form[:price]} type="number" label="Price" />
        <.input field={@form[:size]} label="Size" />
        <:actions>
          <.button phx-disable-with="Saving...">Create Product</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def get_money(%{"price" => ""} = params),
    do: Map.update(params, "price", 0, fn _ -> Money.new(:USD, 0) end)

  def get_money(params) do
    IO.inspect(params)

    Map.update(params, "price", Money.new(:USD, 0), fn price -> Money.new(:USD, price) end)
  end

  def handle_event("validate", %{"product" => params}, socket) do
    params = get_money(params)
    IO.inspect(params)

    changeset =
      %Product{}
      |> Products.change_product(params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"product" => params}, socket) do
    params = get_money(params)
    IO.inspect(params)

    case Products.create_product(params) do
      {:ok, _} ->
        socket =
          socket
          |> put_flash(:info, "Product created successfully")
          |> push_navigate(to: socket.assigns.navigate)

        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end
end
