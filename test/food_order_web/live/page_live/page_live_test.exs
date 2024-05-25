defmodule FoodOrderWeb.PageLiveTest do
  use FoodOrderWeb.ConnCase
  import Phoenix.LiveViewTest

  test "Load main hero HTML", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")
    IO.inspect(view)

    hero_cta = "[data-role=hero-cta]"

    assert has_element?(view, "[data-role=hero]")
    assert has_element?(view, hero_cta)

    assert view |> element(hero_cta <> ">h6") |> render() =~ "Make Your Order"
  end

  test "Load products", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")
    IO.inspect(view)

    product_section = "[data-role=product_section]"

    assert has_element?(view, product_section)

    assert view |> element(product_section <> ">h1") |> render() =~ "foods"
  end
end
