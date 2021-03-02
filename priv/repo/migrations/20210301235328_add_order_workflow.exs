defmodule Scriptdrop.Repo.Migrations.AddOrderWorkflow do
  use Ecto.Migration

  def change do
    create table(:ordersworkflow) do
      add :user_id, references(:users)
      add :order_id, references(:orders)
      add :status, references(:orderstatuses)

      timestamps()
    end

  end
end
