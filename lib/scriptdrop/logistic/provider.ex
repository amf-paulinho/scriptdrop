defmodule Scriptdrop.Logistic.Provider do
  use Ecto.Schema
  import Ecto.Changeset

  schema "providers" do
    field :address, :string
    field :name, :string
    field :role, :integer

    timestamps()
  end

  @doc false
  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:name, :address, :role])
    |> validate_required([:name, :address, :role])
  end
end
