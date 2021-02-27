defmodule Scriptdrop.Plugs.SetUser do
  import Plug.Conn

  alias Scriptdrop.Repo
  alias Scriptdrop.Accounts.User

  def init(_params) do

  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
        user = user_id && Repo.get(User, user_id) ->
          prov = Scriptdrop.Logistic.get_provider!(user.provider_id)
          assign(conn, :user, user |> Map.put(:providermap, prov ) )
        true ->
          assign(conn, :user, nil)
    end
  end
end
