defmodule ScriptdropWeb.OrderWorkflow do
  use ScriptdropWeb, :channel

  alias Scriptdrop.Operation

  def join("orderworkflow:" <> order_id, _params, socket) do
    order_id = String.to_integer(order_id)
    #order = Operation.get_order!(order_id)
    {:ok, %{}, assign(socket, :order_id, order_id)}
  end

  def handle_in(_name, %{"status" => status}, socket) do

    order = Operation.get_order!(socket.assigns.order_id)

    case Operation.update_order(order, %{status: status}) do
      {:ok, _order} ->
        case Operation.create_order_workflow(%{order_id: socket.assigns.order_id, status: status, user_id: socket.assigns.user_id}) do
          {:ok, _order} ->
            {:reply, :ok, socket}

          {:error, %Ecto.Changeset{} = changeset} ->
            {:reply, {:error, %{errors: changeset }}, socket}
        end

      {:error, %Ecto.Changeset{} = changeset} ->
        {:reply, {:error, %{errors: changeset }}, socket}
    end


  end

end
