defmodule Scriptdrop.Global.Drug do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drugs" do
    field :description, :string
    field :unit, :string
    field :price, :integer

    timestamps()
  end

  @doc false
  def changeset(drug, attrs \\ %{}) do
    drug
    |> cast(attrs, [:description, :unit, :price])
    |> validate_required([:description, :unit, :price])
  end
end
