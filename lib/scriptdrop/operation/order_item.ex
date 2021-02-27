defmodule Scriptdrop.Operation.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orderitems" do
    field :qty, :integer
    field :drug_id, :integer
    field :order_id, :integer
    field :price, :integer

    #belongs_to :order, Scriptdrop.Operation.Order
    #has_one :drug, Scriptdrop.Global.Drug

    timestamps()
  end

  @doc false
  def changeset(order_item, attrs \\ %{}) do
    order_item
    |> cast(attrs, [:order_id, :drug_id, :price, :qty])
    |> validate_required([:order_id, :drug_id, :price, :qty])
  end
end
