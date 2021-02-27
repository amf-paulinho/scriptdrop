defmodule ScriptdropWeb.DrugController do
  use ScriptdropWeb, :controller

  alias Scriptdrop.Global
  alias Scriptdrop.Global.Drug

  plug Scriptdrop.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete, :index, :show]

  def index(conn, _params) do
    drugs = Global.list_drugs()
    render(conn, "index.html", drugs: drugs)
  end

  def new(conn, _params) do
    changeset = Global.change_drug(%Drug{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"drug" => drug_params}) do
    case Global.create_drug(drug_params) do
      {:ok, drug} ->
        conn
        |> put_flash(:info, "Drug created successfully.")
        |> redirect(to: Routes.drug_path(conn, :show, drug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    drug = Global.get_drug!(id)
    render(conn, "show.html", drug: drug)
  end

  def edit(conn, %{"id" => id}) do
    drug = Global.get_drug!(id)
    changeset = Global.change_drug(drug)
    render(conn, "edit.html", drug: drug, changeset: changeset)
  end

  def update(conn, %{"id" => id, "drug" => drug_params}) do
    drug = Global.get_drug!(id)

    case Global.update_drug(drug, drug_params) do
      {:ok, drug} ->
        conn
        |> put_flash(:info, "Drug updated successfully.")
        |> redirect(to: Routes.drug_path(conn, :show, drug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", drug: drug, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    drug = Global.get_drug!(id)
    {:ok, _drug} = Global.delete_drug(drug)

    conn
    |> put_flash(:info, "Drug deleted successfully.")
    |> redirect(to: Routes.drug_path(conn, :index))
  end
end
