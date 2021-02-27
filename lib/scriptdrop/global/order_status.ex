defmodule Scriptdrop.Global.OrderStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orderstatuses" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(order_status, attrs) do
    order_status
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
