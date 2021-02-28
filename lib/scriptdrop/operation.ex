defmodule Scriptdrop.Operation do
  @moduledoc """
  The Operation context.
  """

  import Ecto.Query, warn: false
  alias Scriptdrop.Repo

  alias Scriptdrop.Operation.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """

  def list_pharma_tasks(providerid) do
    date = Date.utc_today

    from( o in "orders",
      join: c in "clients",
      on: c.id == o.client_id,
      join: u in "users",
      on: u.id == o.user_id,
      join: p in "providers",
      on: p.id == u.provider_id,
      join: co in "providers",
      on: co.id == o.courier_id,
      join: s in "orderstatuses",
      on: s.id == o.status,
      where: u.provider_id == ^providerid  and fragment("?::date", o.pickup_date) == ^date,
      select: %Scriptdrop.Operation.OrderAux{id: o.id, pickup_date: o.pickup_date, pickup_time: o.pickup_time, status_id: o.status, status: s.description, client_id: o.client_id, courier_id: o.courier_id, user_id: o.user_id, name: c.name, address: c.address, courier: co.name, delivery_address: o.delivery_address, use_file_address: o.use_file_address})
      |> Repo.all

    end


  def list_orders(providerid) do

  from( o in "orders",
    join: c in "clients",
    on: c.id == o.client_id,
    join: u in "users",
    on: u.id == o.user_id,
    join: p in "providers",
    on: p.id == u.provider_id,
    join: co in "providers",
    on: co.id == o.courier_id,
    join: s in "orderstatuses",
    on: s.id == o.status,
    where: u.provider_id == ^providerid,
    select: %Scriptdrop.Operation.OrderAux{id: o.id, pickup_date: o.pickup_date, pickup_time: o.pickup_time, status_id: o.status, status: s.description, client_id: o.client_id, courier_id: o.courier_id, user_id: o.user_id, name: c.name, address: c.address, courier: co.name, delivery_address: o.delivery_address, use_file_address: o.use_file_address})
    |> Repo.all

  end

  def list_courier_tasks(providerid) do
    date = Date.utc_today

    from( o in "orders",
      join: c in "clients",
      on: c.id == o.client_id,
      join: u in "users",
      on: u.id == o.user_id,
      join: pharma in "providers",
      on: pharma.id == o.user_id,
      join: courie in "providers",
      on: courie.id == o.courier_id,
      join: s in "orderstatuses",
      on: s.id == o.status,
      where: o.courier_id == ^providerid and fragment("?::date", o.pickup_date) == ^date,
      select: %Scriptdrop.Operation.OrderAux{id: o.id, pickup_date: o.pickup_date, pickup_time: o.pickup_time, status_id: o.status, status: s.description, client_id: o.client_id, courier_id: o.courier_id, user_id: o.user_id, name: c.name, address: c.address, courier: courie.name, delivery_address: o.delivery_address, use_file_address: o.use_file_address, pharmacy_address: pharma.address, pharmacy_name: pharma.name})
      |> Repo.all

    end


  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

  def get_order_to_show!(id) do
    {int, _x} = Integer.parse(id)

    from( o in "orders",
    join: c in "clients",
    on: c.id == o.client_id,
    join: u in "users",
    on: u.id == o.user_id,
    join: p in "providers",
    on: p.id == u.provider_id,
    join: co in "providers",
    on: co.id == o.courier_id,
    join: s in "orderstatuses",
    on: s.id == o.status,
    where: o.id == ^int,
    select: %Scriptdrop.Operation.OrderAux{id: o.id, pickup_date: o.pickup_date, pickup_time: o.pickup_time, status_id: o.status, status: s.description, client_id: o.client_id, courier_id: o.courier_id, user_id: o.user_id, name: c.name, address: c.address, courier: co.name, delivery_address: o.delivery_address, use_file_address: o.use_file_address})
    |> Repo.one

  end



  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{data: %Order{}}

  """
  def change_order(%Order{} = order, attrs \\ %{}) do
    Order.changeset(order, attrs)
  end

  alias Scriptdrop.Operation.OrderItem

  @doc """
  Returns the list of orderitems.

  ## Examples

      iex> list_orderitems()
      [%OrderItem{}, ...]

  """
  def list_orderitems(order_id) do
    {int, _x} = Integer.parse(order_id)

    from( o in "orderitems",
    where: o.order_id == ^int,
    select: %Scriptdrop.Operation.OrderItem {id: o.id, qty: o.qty, drug_id: o.drug_id, order_id: o.order_id, price: o.price})
    |> Repo.all
  end

  @doc """
  Gets a single order_item.

  Raises `Ecto.NoResultsError` if the Order item does not exist.

  ## Examples

      iex> get_order_item!(123)
      %OrderItem{}

      iex> get_order_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order_item!(id), do: Repo.get!(OrderItem, id)

  @doc """
  Creates a order_item.

  ## Examples

      iex> create_order_item(%{field: value})
      {:ok, %OrderItem{}}

      iex> create_order_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order_item(attrs \\ %{}) do
    %OrderItem{}
    |> OrderItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order_item.

  ## Examples

      iex> update_order_item(order_item, %{field: new_value})
      {:ok, %OrderItem{}}

      iex> update_order_item(order_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order_item(%OrderItem{} = order_item, attrs) do
    order_item
    |> OrderItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order_item.

  ## Examples

      iex> delete_order_item(order_item)
      {:ok, %OrderItem{}}

      iex> delete_order_item(order_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order_item(%OrderItem{} = order_item) do
    Repo.delete(order_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order_item changes.

  ## Examples

      iex> change_order_item(order_item)
      %Ecto.Changeset{data: %OrderItem{}}

  """
  def change_order_item(%OrderItem{} = order_item, attrs \\ %{}) do
    OrderItem.changeset(order_item, attrs)
  end
end
