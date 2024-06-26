defmodule FoodOrder.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    up_query = """
    CREATE TYPE public.money_with_currency AS (currency_code varchar, amount numeric);
    """

    down_query = """
    DROP TYPE public.money_with_currency;
    """

    execute(up_query, down_query)

    create_query = "CREATE TYPE public.sizes as ENUM('SMALL', 'MEDIUM', 'LARGE')"
    drop_query = "DROP TYPE public.sizes"
    execute(create_query, drop_query)

    create table(:products) do
      add :name, :string
      add :price, :money_with_currency
      add :size, :sizes, default: "SMALL", null: false
      add :description, :text
      add :image_url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
