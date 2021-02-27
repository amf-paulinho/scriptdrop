defmodule Scriptdrop.Operation.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :pickup_date, :date
    field :pickup_time, :time
    field :status, :integer
    field :client_id, :integer
    field :courier_id, :integer
    field :user_id, :integer
    field :delivery_address, :string
    field :use_file_address, :boolean

    #has_many :orderitem, Scriptdrop.Operation.OrderItem
    #has_one :client, Scriptdrop.Global.Client
    #belongs_to :user, Scriptdrop.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(order, attrs \\ %{}) do
    order
    |> cast(attrs, [:pickup_date, :pickup_time, :status, :client_id, :courier_id, :user_id, :delivery_address, :use_file_address])
    |> validate_required([:pickup_date, :pickup_time, :status, :client_id, :courier_id, :user_id, :delivery_address, :use_file_address])
  end
end
