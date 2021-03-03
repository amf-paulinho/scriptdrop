defmodule ScriptdropWeb.PageLive do
  use ScriptdropWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  @impl true
  def handle_event("suggest", %{"q" => query}, socket) do

res = Scriptdrop.Global.suggest_clients(query) #|> Enum.map(&{"#{&1.name}", &1.id})

    {:noreply, assign(socket, results: res, query: query)}

  end

  @impl true
  def handle_event("viewfile", %{"q" => query}, socket) do

    IO.puts("++++++++++++++++")
    IO.puts(query)

    {:noreply,
    socket
    |> assign(results: %{}, query: query)}




  end

end
