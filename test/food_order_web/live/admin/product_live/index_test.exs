defmodule FoodOrderWeb.Admin.ProductLive.IndexTest do
  use FoodOrderWeb.ConnCase
  import Phoenix.LiveViewTest
  import FoodOrder.ProductsFixtures

  describe "index" do
    setup [:create_product]

    test "List all products", %{conn: conn, product: product} do
      {:ok, view, _html} = live(conn, ~p"/admin/products")

      product_id = "#products-#{product.id}"
      product_data = product_id <> ">td>div>span"

      assert has_element?(view, "header>div>h1", "List Products")
      assert has_element?(view, product_id)
      assert has_element?(view, product_data, product.name)

      assert has_element?(
               view,
               product_data,
               Money.to_string(product.price)
             )

      assert has_element?(
               view,
               product_data,
               Atom.to_string(product.size)
             )

      # open_browser(view)
    end

    test "Add new product", %{conn: conn, product: product} do
      {:ok, view, _html} = live(conn, ~p"/admin/products")

      assert view
             |> element("header>div>a", "New Product")
             |> render_click()

      assert_patch(view, ~p"/admin/products/new")
      assert view |> has_element?("#new-product-modal")
    end
  end

  def create_product(opts) do
    %{product: product_fixture()}
  end
end
