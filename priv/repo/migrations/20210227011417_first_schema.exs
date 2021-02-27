defmodule Scriptdrop.Repo.Migrations.FirstSchema do
  use Ecto.Migration

  def change do

    create table(:providers) do
      add :name, :string
      add :address, :string
      add :role, :integer

      timestamps()
    end

    create table(:pharmacouriers) do
      add :provider_id, references(:providers)
      add :courier_id, references(:providers)
      add :active, :boolean, default: false, null: false

      timestamps()
    end

    create table(:users) do
      add :provider, :string
      add :email, :string
      add :token, :string
      add :provider_id, references(:providers)

      timestamps()
    end

    create table(:drugs) do
      add :description, :string
      add :unit, :string
      add :price, :integer

      timestamps()
    end

    create table(:clients) do
      add :name, :string
      add :address, :string

      timestamps()
    end

    create table(:orders) do
      add :pickup_date, :date
      add :pickup_time, :time

      add :user_id, references(:users)
      add :courier_id, references(:providers)

      add :client_id, references(:clients)
      add :delivery_address, :string
      add :use_file_address, :boolean

      add :status, :integer

      timestamps()
    end

    create table(:orderitems) do
      add :order_id, references(:orders)

      add :drug_id, references(:drugs)
      add :qty, :integer
      add :price, :integer

      timestamps()
    end

    create table(:orderstatuses) do
      add :description, :string

      timestamps()
    end

  end
end
