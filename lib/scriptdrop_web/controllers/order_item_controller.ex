defmodule ScriptdropWeb.OrderItemController do
  use ScriptdropWeb, :controller

  alias Scriptdrop.Operation
  alias Scriptdrop.Operation.OrderItem


  def new(conn, %{"id" => id}) do
    order = Operation.get_order!(id)

    changeset = Operation.change_order_item(%OrderItem{order_id: order.id})

    drugs =
      Scriptdrop.Global.list_drugs
      |> Enum.map(&{"#{&1.description}", &1.id})


    render(conn, "new.html", changeset: changeset, drugs: drugs, order_item: %OrderItem{order_id: id})
  end

  def create(conn, %{"order_item" => order_item_params}) do
    case Operation.create_order_item(order_item_params) do
      {:ok, _order_item} ->
        conn
        |> put_flash(:info, "Order item created successfully.")
        |> redirect(to: Routes.order_path(conn, :show, %Scriptdrop.Operation.Order{id: order_item_params["order_id"]}))

      {:error, %Ecto.Changeset{} = changeset} ->
        drugs =
          Scriptdrop.Global.list_drugs
          |> Enum.map(&{"#{&1.description}", &1.id})

        render(conn, "new.html", changeset: changeset, drugs: drugs)
    end
  end

  def show(conn, %{"id" => id}) do
    order_item = Operation.get_order_item!(id)

    drugs =
      Scriptdrop.Global.list_drugs
      |> Enum.map(&{"#{&1.description}", &1.id})

    render(conn, "show.html", order_item: order_item, drugs: drugs)
  end

  def edit(conn, %{"id" => id}) do
    order_item = Operation.get_order_item!(id)
    changeset = Operation.change_order_item(order_item)

    drugs =
      Scriptdrop.Global.list_drugs
      |> Enum.map(&{"#{&1.description}", &1.id})

    render(conn, "edit.html", order_item: order_item, changeset: changeset, drugs: drugs)
  end

  def update(conn, %{"id" => id, "order_item" => order_item_params}) do
    order_item = Operation.get_order_item!(id)

    case Operation.update_order_item(order_item, order_item_params) do
      {:ok, _order_item} ->
        conn
        |> put_flash(:info, "Order item updated successfully.")
        |> redirect(to: Routes.order_path(conn, :show, %Scriptdrop.Operation.Order{id: order_item_params["order_id"]}))

      {:error, %Ecto.Changeset{} = changeset} ->

        drugs =
          Scriptdrop.Global.list_drugs
          |> Enum.map(&{"#{&1.description}", &1.id})

        render(conn, "edit.html", order_item: order_item, changeset: changeset, drugs: drugs)
    end
  end

  def delete(conn, %{"id" => id}) do
    order_item = Operation.get_order_item!(id)
    {:ok, _order_item} = Operation.delete_order_item(order_item)

    conn
    |> put_flash(:info, "Order item deleted successfully.")
    |> redirect(to: Routes.order_path(conn, :show, %Scriptdrop.Operation.Order{id: order_item.order_id}))
  end
end
