defmodule ScriptdropWeb.OrderItemController do
  use ScriptdropWeb, :controller

  alias Scriptdrop.Operation
  alias Scriptdrop.Operation.OrderItem

  def index(conn, _params) do

    orderitems = Operation.list_orderitems()
    render(conn, "index.html", orderitems: orderitems)
  end

  def new(conn, _params) do
    changeset = Operation.change_order_item(%OrderItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"order_item" => order_item_params}) do
    case Operation.create_order_item(order_item_params) do
      {:ok, order_item} ->
        conn
        |> put_flash(:info, "Order item created successfully.")
        |> redirect(to: Routes.order_item_path(conn, :show, order_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    order_item = Operation.get_order_item!(id)
    render(conn, "show.html", order_item: order_item)
  end

  def edit(conn, %{"id" => id}) do
    order_item = Operation.get_order_item!(id)
    changeset = Operation.change_order_item(order_item)
    render(conn, "edit.html", order_item: order_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "order_item" => order_item_params}) do
    order_item = Operation.get_order_item!(id)

    case Operation.update_order_item(order_item, order_item_params) do
      {:ok, order_item} ->
        conn
        |> put_flash(:info, "Order item updated successfully.")
        |> redirect(to: Routes.order_item_path(conn, :show, order_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", order_item: order_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    order_item = Operation.get_order_item!(id)
    {:ok, _order_item} = Operation.delete_order_item(order_item)

    conn
    |> put_flash(:info, "Order item deleted successfully.")
    |> redirect(to: Routes.order_item_path(conn, :index))
  end
end
