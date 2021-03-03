defmodule Scriptdrop.Repo.Migrations.AlterOrderDeleteCascade do
  use Ecto.Migration

  def change do
    execute "ALTER TABLE orderitems DROP CONSTRAINT orderitems_order_id_fkey"
    execute "ALTER TABLE ordersworkflow DROP CONSTRAINT ordersworkflow_order_id_fkey"

    alter table(:orderitems) do
      modify :order_id, references(:orders, on_delete: :delete_all)
    end

    alter table(:ordersworkflow) do
      modify :order_id, references(:orders, on_delete: :delete_all)
    end

  end
end
