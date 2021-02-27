defmodule Scriptdrop.Logistic.PharmaCourier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pharmacouriers" do
    field :active, :boolean, default: false
    field :courier_id, :integer
    field :provider_id, :integer

    timestamps()
  end

  @doc false
  def changeset(pharma_courier, attrs) do
    pharma_courier
    |> cast(attrs, [:provider_id, :courier_id, :active])
    |> validate_required([:provider_id, :courier_id, :active])
  end
end
