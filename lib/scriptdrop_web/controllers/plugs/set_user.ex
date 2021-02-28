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

          #for some reason when I try acess providermap from a single specific page i got a error
          #in all other pages works fine ! So just for now I am using a not importat property to store
          #user Role and test it at app.html
          #TODO: Solve this Bug




          user = %User{user | provider: getrole(prov.role)}

          assign(conn, :user, user |> Map.put(:providermap, prov ) )
        true ->
          assign(conn, :user, nil)
    end
  end

  defp getrole(role) do
    if role == 1 do
      "Pharmacy"
    else
      "Courier"
    end
  end

end
