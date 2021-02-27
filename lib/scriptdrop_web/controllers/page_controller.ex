defmodule ScriptdropWeb.PageController do
  use ScriptdropWeb, :controller

  alias Scriptdrop.Operation

  plug Scriptdrop.Plugs.RequireAuth when action in [:index]

  def index(conn, _params) do

    if conn.assigns.user && conn.assigns.user.providermap.role == 1 do #Pharmacy
       orders = Operation.list_pharma_tasks(conn.assigns.user.provider_id)
       render(conn, "index.html", orders: orders)
    else #Courier
       orders = Operation.list_courier_tasks(conn.assigns.user.provider_id)
       render(conn, "index.html", orders: orders)
    end

  end

  def about(conn, _params) do
       render(conn, "about.html")
  end

end
