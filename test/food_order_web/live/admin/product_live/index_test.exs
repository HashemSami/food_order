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

      # assert has_element?(view, "header>div>h1", "List Products")
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

    test "Add new product", %{conn: conn, product: _product} do
      {:ok, view, _html} = live(conn, ~p"/admin/products")

      assert view
             |> element("header>div>a", "New Product")
             |> render_click()

      assert_patch(view, ~p"/admin/products/new")
      assert view |> has_element?("#new-product-modal")

      assert view
             |> form("#product-form", product: %{})
             |> render_change() =~ "blank"

      {:ok, _view, html} =
        view
        |> form("#product-form",
          product: %{
            name: "Product Name",
            description: "Product Description",
            price: 100,
            size: "LARGE"
          }
        )
        |> render_submit()
        |> follow_redirect(conn, ~p"/admin/products")

      assert html =~ "Product created successfully"
      assert html =~ "Product 1 NAme"
    end
  end

  def create_product(_opts) do
    %{product: product_fixture()}
  end
end
