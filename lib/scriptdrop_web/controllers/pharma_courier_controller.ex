defmodule ScriptdropWeb.PharmaCourierController do
  use ScriptdropWeb, :controller

  alias Scriptdrop.Logistic
  alias Scriptdrop.Logistic.PharmaCourier

  plug Scriptdrop.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete, :index, :show]

  def index(conn, _params) do
    pharmacouriers = Logistic.list_pharmacouriers(conn.assigns.user.provider_id)
    render(conn, "index.html", pharmacouriers: pharmacouriers)
  end

  def new(conn, _params) do
    changeset = Logistic.change_pharma_courier(%PharmaCourier{provider_id: conn.assigns.user.provider_id})

    couriers =
      Scriptdrop.Logistic.list_couriers
        |> Enum.map(&{"#{&1.name}", &1.id})

    render(conn, "new.html", changeset: changeset, couriers: couriers)
  end

  def create(conn, %{"pharma_courier" => pharma_courier_params}) do
    case Logistic.create_pharma_courier(pharma_courier_params) do
      {:ok, _pharma_courier} ->
        conn
        |> put_flash(:info, "Pharma courier created successfully.")
        |> redirect(to: Routes.pharma_courier_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pharma_courier = Logistic.get_pharma_courier!(id)
    render(conn, "show.html", pharma_courier: pharma_courier)
  end

  def edit(conn, %{"id" => id}) do
    pharma_courier = Logistic.get_pharma_courier!(id)
    changeset = Logistic.change_pharma_courier(pharma_courier)

    couriers =
      Scriptdrop.Logistic.list_couriers
        |> Enum.map(&{"#{&1.name}", &1.id})

    render(conn, "edit.html", pharma_courier: pharma_courier, changeset: changeset, couriers: couriers)
  end

  def update(conn, %{"id" => id, "pharma_courier" => pharma_courier_params}) do
    pharma_courier = Logistic.get_pharma_courier!(id)

    case Logistic.update_pharma_courier(pharma_courier, pharma_courier_params) do
      {:ok, _pharma_courier} ->
        conn
        |> put_flash(:info, "Pharma courier updated successfully.")
        |> redirect(to: Routes.pharma_courier_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pharma_courier: pharma_courier, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pharma_courier = Logistic.get_pharma_courier!(id)
    {:ok, _pharma_courier} = Logistic.delete_pharma_courier(pharma_courier)

    conn
    |> put_flash(:info, "Pharma courier deleted successfully.")
    |> redirect(to: Routes.pharma_courier_path(conn, :index))
  end
end
