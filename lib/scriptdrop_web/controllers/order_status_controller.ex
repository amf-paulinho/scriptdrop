defmodule ScriptdropWeb.OrderStatusController do
  use ScriptdropWeb, :controller

  alias Scriptdrop.Global
  alias Scriptdrop.Global.OrderStatus

  def index(conn, _params) do
    orderstatuses = Global.list_orderstatuses()
    render(conn, "index.html", orderstatuses: orderstatuses)
  end

  def new(conn, _params) do
    changeset = Global.change_order_status(%OrderStatus{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"order_status" => order_status_params}) do
    case Global.create_order_status(order_status_params) do
      {:ok, order_status} ->
        conn
        |> put_flash(:info, "Order status created successfully.")
        |> redirect(to: Routes.order_status_path(conn, :show, order_status))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    order_status = Global.get_order_status!(id)
    render(conn, "show.html", order_status: order_status)
  end

  def edit(conn, %{"id" => id}) do
    order_status = Global.get_order_status!(id)
    changeset = Global.change_order_status(order_status)
    render(conn, "edit.html", order_status: order_status, changeset: changeset)
  end

  def update(conn, %{"id" => id, "order_status" => order_status_params}) do
    order_status = Global.get_order_status!(id)

    case Global.update_order_status(order_status, order_status_params) do
      {:ok, order_status} ->
        conn
        |> put_flash(:info, "Order status updated successfully.")
        |> redirect(to: Routes.order_status_path(conn, :show, order_status))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", order_status: order_status, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    order_status = Global.get_order_status!(id)
    {:ok, _order_status} = Global.delete_order_status(order_status)

    conn
    |> put_flash(:info, "Order status deleted successfully.")
    |> redirect(to: Routes.order_status_path(conn, :index))
  end
end
