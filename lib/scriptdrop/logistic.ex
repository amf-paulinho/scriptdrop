defmodule Scriptdrop.Logistic do
  @moduledoc """
  The Logistic context.
  """

  import Ecto.Query, warn: false
  alias Scriptdrop.Repo

  alias Scriptdrop.Logistic.Provider

  def list_couriers_by_provider(id) do
    from( pc in "pharmacouriers",
    join: p in "providers",
    on: p.id == pc.courier_id,
    where: pc.provider_id == ^id,
    select: %Provider{id: p.id, name: p.name})
    |> Repo.all
  end

  def list_couriers do
    qry = from p in Provider, where: p.role == 2
    Repo.all(qry)
  end

  def list_pharmas do
    qry = from p in Provider, where: p.role == 1
    Repo.all(qry)
  end

  def list_providerroles do
    [
      %{id: 1, description: "Pharmacy"},
      %{id: 2, description: "Courier"}
    ]
  end


  @doc """
  Returns the list of providers.

  ## Examples

      iex> list_providers()
      [%Provider{}, ...]

  """
  def list_providers do
    Repo.all(Provider)
  end

  @doc """
  Gets a single provider.

  Raises `Ecto.NoResultsError` if the Provider does not exist.

  ## Examples

      iex> get_provider!(123)
      %Provider{}

      iex> get_provider!(456)
      ** (Ecto.NoResultsError)

  """
  def get_provider!(id), do: Repo.get!(Provider, id)

  @doc """
  Creates a provider.

  ## Examples

      iex> create_provider(%{field: value})
      {:ok, %Provider{}}

      iex> create_provider(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_provider(attrs \\ %{}) do
    %Provider{}
    |> Provider.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a provider.

  ## Examples

      iex> update_provider(provider, %{field: new_value})
      {:ok, %Provider{}}

      iex> update_provider(provider, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_provider(%Provider{} = provider, attrs) do
    provider
    |> Provider.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a provider.

  ## Examples

      iex> delete_provider(provider)
      {:ok, %Provider{}}

      iex> delete_provider(provider)
      {:error, %Ecto.Changeset{}}

  """
  def delete_provider(%Provider{} = provider) do
    Repo.delete(provider)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking provider changes.

  ## Examples

      iex> change_provider(provider)
      %Ecto.Changeset{data: %Provider{}}

  """
  def change_provider(%Provider{} = provider, attrs \\ %{}) do
    Provider.changeset(provider, attrs)
  end

  alias Scriptdrop.Logistic.PharmaCourier


  @doc """
  Returns the list of pharmacouriers.

  ## Examples

      iex> list_pharmacouriers()
      [%PharmaCourier{}, ...]

  """
  def list_pharmacouriers(id) do
    from( pc in "pharmacouriers",
    join: p in "providers",
    on: p.id == pc.courier_id,
    where: pc.provider_id == ^id,
    select: %Scriptdrop.Logistic.PharmaCourierAux{id: pc.id, active: pc.active, courier_id: pc.courier_id, provider_id: pc.provider_id, name: p.name, address: p.address})
    |> Repo.all
  end

  @doc """
  Gets a single pharma_courier.

  Raises `Ecto.NoResultsError` if the Pharma courier does not exist.

  ## Examples

      iex> get_pharma_courier!(123)
      %PharmaCourier{}

      iex> get_pharma_courier!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pharma_courier!(id), do: Repo.get!(PharmaCourier, id)

  @doc """
  Creates a pharma_courier.

  ## Examples

      iex> create_pharma_courier(%{field: value})
      {:ok, %PharmaCourier{}}

      iex> create_pharma_courier(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pharma_courier(attrs \\ %{}) do
    %PharmaCourier{}
    |> PharmaCourier.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pharma_courier.

  ## Examples

      iex> update_pharma_courier(pharma_courier, %{field: new_value})
      {:ok, %PharmaCourier{}}

      iex> update_pharma_courier(pharma_courier, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pharma_courier(%PharmaCourier{} = pharma_courier, attrs) do
    pharma_courier
    |> PharmaCourier.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pharma_courier.

  ## Examples

      iex> delete_pharma_courier(pharma_courier)
      {:ok, %PharmaCourier{}}

      iex> delete_pharma_courier(pharma_courier)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pharma_courier(%PharmaCourier{} = pharma_courier) do
    Repo.delete(pharma_courier)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pharma_courier changes.

  ## Examples

      iex> change_pharma_courier(pharma_courier)
      %Ecto.Changeset{data: %PharmaCourier{}}

  """
  def change_pharma_courier(%PharmaCourier{} = pharma_courier, attrs \\ %{}) do
    PharmaCourier.changeset(pharma_courier, attrs)
  end

end
