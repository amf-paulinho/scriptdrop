defmodule Scriptdrop.Global.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :address, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs \\ %{}) do
    client
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
