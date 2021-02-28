defmodule ScriptdropWeb.ProviderController do
  use ScriptdropWeb, :controller

  alias Scriptdrop.Logistic
  alias Scriptdrop.Logistic.Provider

  def index(conn, _params) do
    providers = Logistic.list_providers()
    render(conn, "index.html", providers: providers)
  end

  def new(conn, _params) do
    changeset = Logistic.change_provider(%Provider{})

    providerroles = Logistic.list_providerroles
    |> Enum.map(&{"#{&1.description}", &1.id})

    render(conn, "new.html", changeset: changeset, providerroles: providerroles)
  end

  def create(conn, %{"provider" => provider_params}) do


    case Logistic.create_provider(provider_params) do
      {:ok, provider} ->
        conn
        |> put_flash(:info, "Provider created successfully.")
        |> redirect(to: Routes.provider_path(conn, :show, provider))

      {:error, %Ecto.Changeset{} = changeset} ->
        providerroles = Logistic.list_providerroles
        |> Enum.map(&{"#{&1.description}", &1.id})

        render(conn, "new.html", changeset: changeset, providerroles: providerroles)
    end
  end

  def show(conn, %{"id" => id}) do
    provider = Logistic.get_provider!(id)
    render(conn, "show.html", provider: provider)
  end

  def edit(conn, %{"id" => id}) do
    provider = Logistic.get_provider!(id)
    changeset = Logistic.change_provider(provider)

    providerroles = Logistic.list_providerroles
    |> Enum.map(&{"#{&1.description}", &1.id})

    render(conn, "edit.html", provider: provider, changeset: changeset, providerroles: providerroles)
  end

  def update(conn, %{"id" => id, "provider" => provider_params}) do
    provider = Logistic.get_provider!(id)

    case Logistic.update_provider(provider, provider_params) do
      {:ok, provider} ->
        conn
        |> put_flash(:info, "Provider updated successfully.")
        |> redirect(to: Routes.provider_path(conn, :show, provider))

      {:error, %Ecto.Changeset{} = changeset} ->
        providerroles = Logistic.list_providerroles
        |> Enum.map(&{"#{&1.description}", &1.id})

        render(conn, "edit.html", provider: provider, changeset: changeset, providerroles: providerroles)
    end
  end

  def delete(conn, %{"id" => id}) do

    # i have to refactor that for sure !

    if notmainprovider(id) do
       msg = "Provider deleted successfully."
       provider = Logistic.get_provider!(id)
       {:ok, _provider} = Logistic.delete_provider(provider)
       conn
       |> put_flash(:info, msg)
       |> redirect(to: Routes.provider_path(conn, :index))

    else
      msg = "You cannot delete the main provider."
      conn
      |> put_flash(:info, msg)
      |> redirect(to: Routes.provider_path(conn, :index))

    end

  end

  defp notmainprovider(id) do
    id != -5
  end
end
