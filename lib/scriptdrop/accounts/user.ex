defmodule Scriptdrop.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    field :provider_id, :integer
    has_many :orders, Scriptdrop.Operation.Order

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:provider, :email, :token, :provider_id ])
    |> validate_required([:email, :provider_id ])
  end
end
