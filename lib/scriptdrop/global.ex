defmodule Scriptdrop.Global do
  @moduledoc """
  The Global context.
  """

  import Ecto.Query, warn: false
  alias Scriptdrop.Repo

  alias Scriptdrop.Global.Drug

  @doc """
  Returns the list of drugs.

  ## Examples

      iex> list_drugs()
      [%Drug{}, ...]

  """
  def list_drugs do
    Repo.all(Drug)
  end

  @doc """
  Gets a single drug.

  Raises `Ecto.NoResultsError` if the Drug does not exist.

  ## Examples

      iex> get_drug!(123)
      %Drug{}

      iex> get_drug!(456)
      ** (Ecto.NoResultsError)

  """
  def get_drug!(id), do: Repo.get!(Drug, id)

  @doc """
  Creates a drug.

  ## Examples

      iex> create_drug(%{field: value})
      {:ok, %Drug{}}

      iex> create_drug(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_drug(attrs \\ %{}) do
    %Drug{}
    |> Drug.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a drug.

  ## Examples

      iex> update_drug(drug, %{field: new_value})
      {:ok, %Drug{}}

      iex> update_drug(drug, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_drug(%Drug{} = drug, attrs) do
    drug
    |> Drug.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a drug.

  ## Examples

      iex> delete_drug(drug)
      {:ok, %Drug{}}

      iex> delete_drug(drug)
      {:error, %Ecto.Changeset{}}

  """
  def delete_drug(%Drug{} = drug) do
    Repo.delete(drug)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking drug changes.

  ## Examples

      iex> change_drug(drug)
      %Ecto.Changeset{data: %Drug{}}

  """
  def change_drug(%Drug{} = drug, attrs \\ %{}) do
    Drug.changeset(drug, attrs)
  end

  alias Scriptdrop.Global.Client

  @doc """
  Returns the list of clients.

  ## Examples

      iex> list_clients()
      [%Client{}, ...]

  """
  def list_clients do
    Repo.all(Client)
  end




  @doc """
  Gets a single client.

  Raises `Ecto.NoResultsError` if the Client does not exist.

  ## Examples

      iex> get_client!(123)
      %Client{}

      iex> get_client!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client!(id), do: Repo.get!(Client, id)

  @doc """
  Creates a client.

  ## Examples

      iex> create_client(%{field: value})
      {:ok, %Client{}}

      iex> create_client(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client(attrs \\ %{}) do
    %Client{}
    |> Client.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a client.

  ## Examples

      iex> update_client(client, %{field: new_value})
      {:ok, %Client{}}

      iex> update_client(client, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client(%Client{} = client, attrs) do
    client
    |> Client.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a client.

  ## Examples

      iex> delete_client(client)
      {:ok, %Client{}}

      iex> delete_client(client)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client changes.

  ## Examples

      iex> change_client(client)
      %Ecto.Changeset{data: %Client{}}

  """
  def change_client(%Client{} = client, attrs \\ %{}) do
    Client.changeset(client, attrs)
  end

  alias Scriptdrop.Global.OrderStatus

  @doc """
  Returns the list of orderstatuses.

  ## Examples

      iex> list_orderstatuses()
      [%OrderStatus{}, ...]

  """
  def list_orderstatuses do
    Repo.all(OrderStatus)

  end

  @doc """
  Gets a single order_status.

  Raises `Ecto.NoResultsError` if the Order status does not exist.

  ## Examples

      iex> get_order_status!(123)
      %OrderStatus{}

      iex> get_order_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order_status!(id), do: Repo.get!(OrderStatus, id)

  @doc """
  Creates a order_status.

  ## Examples

      iex> create_order_status(%{field: value})
      {:ok, %OrderStatus{}}

      iex> create_order_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order_status(attrs \\ %{}) do
    %OrderStatus{}
    |> OrderStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order_status.

  ## Examples

      iex> update_order_status(order_status, %{field: new_value})
      {:ok, %OrderStatus{}}

      iex> update_order_status(order_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order_status(%OrderStatus{} = order_status, attrs) do
    order_status
    |> OrderStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order_status.

  ## Examples

      iex> delete_order_status(order_status)
      {:ok, %OrderStatus{}}

      iex> delete_order_status(order_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order_status(%OrderStatus{} = order_status) do
    Repo.delete(order_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order_status changes.

  ## Examples

      iex> change_order_status(order_status)
      %Ecto.Changeset{data: %OrderStatus{}}

  """
  def change_order_status(%OrderStatus{} = order_status, attrs \\ %{}) do
    OrderStatus.changeset(order_status, attrs)
  end
end
