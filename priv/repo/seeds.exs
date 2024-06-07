# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FoodOrder.Repo.insert!(%FoodOrder.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias FoodOrder.Products

for _ <- 0..100,
    do:
      Products.create_product(%{
        description: "some description",
        name: "burger #{:rand.uniform(10_000)}",
        price: Money.new(:SAR, :rand.uniform(10_000)),
        size: Enum.random(["SMALL", "MEDIUM", "LARGE"]),
        image_url: "product_#{:rand.uniform(4)}.jpg"
      })
