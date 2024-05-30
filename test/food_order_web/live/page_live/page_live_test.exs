defmodule FoodOrderWeb.PageLiveTest do
  use FoodOrderWeb.ConnCase
  import Phoenix.LiveViewTest
  import FoodOrder.ProductsFixtures

  test "Load main hero HTML", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")

    hero_cta = "[data-role=hero-cta]"

    assert has_element?(view, "[data-role=hero]")
    assert has_element?(view, hero_cta)

    assert view |> element(hero_cta <> ">h6") |> render() =~ "Make Your Order"
  end

  test "Load products header", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")

    product_section = "[data-role=product_section]"
    assert view |> element(product_section <> ">h1") |> render() =~ "foods"
  end

  test "Load products", %{conn: conn} do
    product = product_fixture()

    {:ok, view, _html} = live(conn, ~p"/")

    product_item = "[data-role=item][data-id=#{product.id}]"

    assert element(view, product_item) |> render()
    assert has_element?(view, product_item)
    assert has_element?(view, product_item <> ">img")
    assert has_element?(view, product_item, product.name)
    assert has_element?(view, product_item <> ">div>span", Atom.to_string(product.size))
    assert has_element?(view, product_item <> ">div>div>span", Money.to_string(product.price))
  end
end
