defmodule ScriptdropWeb.OrderController do
  use ScriptdropWeb, :controller

  alias Scriptdrop.Operation
  alias Scriptdrop.Operation.Order

  plug Scriptdrop.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete, :index, :show]

  def index(conn, _params) do
    orders = Operation.list_orders(conn.assigns.user.provider_id)
    render(conn, "index.html", orders: orders)
  end

  def new(conn, _params) do

    changeset = Operation.change_order(%Order{user_id: conn.assigns.user.id })

    clients =
      Scriptdrop.Global.list_clients
        |> Enum.map(&{"#{&1.name} at #{&1.address}", &1.id})

    couriers =
      Scriptdrop.Logistic.list_couriers_by_provider(conn.assigns.user.provider_id)
        |> Enum.map(&{"#{&1.name}", &1.id})

    statuslist =
      Scriptdrop.Global.list_orderstatuses
      |> Enum.map(&{"#{&1.description}", &1.id})


    render(conn, "new.html", changeset: changeset, clients: clients, couriers: couriers, statuslist: statuslist)
  end

  def create(conn, %{"order" => order_params}) do
    case Operation.create_order(order_params) do
      {:ok, order} ->
        # this should be in a transaction or a trigger
        Operation.create_order_workflow(%{order_id: order.id, status: order.status, user_id: order.user_id})

        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        clients =
          Scriptdrop.Global.list_clients
            |> Enum.map(&{"#{&1.name} at #{&1.address}", &1.id})

        couriers =
          Scriptdrop.Logistic.list_couriers_by_provider(conn.assigns.user.provider_id)
            |> Enum.map(&{"#{&1.name}", &1.id})

        statuslist =
          Scriptdrop.Global.list_orderstatuses
          |> Enum.map(&{"#{&1.description}", &1.id})

        render(conn, "new.html", changeset: changeset, clients: clients, couriers: couriers, statuslist: statuslist)
    end
  end

  def show(conn, %{"id" => id}) do

    order = Operation.get_order_to_show!(id)

    orderitems = Operation.list_orderitems(id)

    orderworkflow = Operation.list_workflow(id)

    render(conn, "show.html", order: order, orderitems: orderitems, orderworkflow: orderworkflow)
  end

  def edit(conn, %{"id" => id}) do
    order = Operation.get_order!(id)
    changeset = Operation.change_order(order)

    clients =
      Scriptdrop.Global.list_clients
        |> Enum.map(&{"#{&1.name} at #{&1.address}", &1.id})

    couriers =
      Scriptdrop.Logistic.list_couriers_by_provider(conn.assigns.user.provider_id)
        |> Enum.map(&{"#{&1.name}", &1.id})

    statuslist =
      Scriptdrop.Global.list_orderstatuses
      |> Enum.map(&{"#{&1.description}", &1.id})

    render(conn, "edit.html", order: order, changeset: changeset, clients: clients, couriers: couriers, statuslist: statuslist)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Operation.get_order!(id)

    case Operation.update_order(order, order_params) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order updated successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->

        clients =
          Scriptdrop.Global.list_clients
            |> Enum.map(&{"#{&1.name} at #{&1.address}", &1.id})

        couriers =
          Scriptdrop.Logistic.list_couriers_by_provider(conn.assigns.user.provider_id)
            |> Enum.map(&{"#{&1.name}", &1.id})

        statuslist =
          Scriptdrop.Global.list_orderstatuses
          |> Enum.map(&{"#{&1.description}", &1.id})


        render(conn, "edit.html", order: order, changeset: changeset, clients: clients, couriers: couriers, statuslist: statuslist)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Operation.get_order!(id)

    {:ok, _order} = Operation.delete_order(order)

    conn
    |> put_flash(:info, "Order deleted successfully.")
    |> redirect(to: Routes.order_path(conn, :index))
  end
end
