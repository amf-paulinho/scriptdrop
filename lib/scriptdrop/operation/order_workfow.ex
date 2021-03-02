defmodule Scriptdrop.Operation.OrderWorkflow do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ordersworkflow" do
    field :user_id, :integer
    field :order_id, :integer
    field :status, :integer

    timestamps()
  end

  @doc false
  def changeset(order, attrs \\ %{}) do
    order
    |> cast(attrs, [:user_id, :order_id, :status])
    |> validate_required([:user_id, :order_id, :status])
  end
end
