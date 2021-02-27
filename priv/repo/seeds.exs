# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Scriptdrop.Repo.insert!(%Scriptdrop.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Scriptdrop.Repo

seed_data = [
              #Order Statuses
              %Scriptdrop.Global.OrderStatus{id: -4, description: "Awaiting Courier"},
              %Scriptdrop.Global.OrderStatus{id: -3, description: "Awaiting Delivery"},
              %Scriptdrop.Global.OrderStatus{id: -2, description: "Delivered"},
              %Scriptdrop.Global.OrderStatus{id: -1, description: "Canceled"},

              #Meds
              %Scriptdrop.Global.Drug{id: -4, unit: "MG", price: 1, description: "Naltrexone"},
              %Scriptdrop.Global.Drug{id: -3, unit: "ML", price: 2, description: "Benadril"},
              %Scriptdrop.Global.Drug{id: -2, unit: "MCG",price: 3, description: "Vit A"},
              %Scriptdrop.Global.Drug{id: -1, unit: "UI", price: 4, description: "Vit E"},

              #Clients
              %Scriptdrop.Global.Client{id: -4, name: "Benedict Arnold",  address: "1741 Army Street, Norwich, CT"},
              %Scriptdrop.Global.Client{id: -3, name: "Jesse James",  address: " 1847 Guerrilla Ave, Kearney, MO"},
              %Scriptdrop.Global.Client{id: -2, name: "Billy the Kid", address: "1859 OldWest Street, New York, NY"},
              %Scriptdrop.Global.Client{id: -1, name: "Wild Bill Hickok",  address: "1837 Showman CT, LaSalle County, IL"},

              #Pharmacies
              %Scriptdrop.Logistic.Provider{id: -5, name: "BetterRx",  address: "1275 Kinnear Road, Columbus, OH 43212", role: 1},
              %Scriptdrop.Logistic.Provider{id: -4, name: "BestRx",  address: "123 Austin St, Austin, TX 78702", role: 1},
              %Scriptdrop.Logistic.Provider{id: -3, name: "Drugs R Us",  address: "4925 LA Ave, Los Angeles, CA 90056", role: 1},

              #Couriers
              %Scriptdrop.Logistic.Provider{id: -2, name: "Same Day Delivery",  address: "900 Trenton Lane, Trenton, NJ 08536", role: 2},
              %Scriptdrop.Logistic.Provider{id: -1, name: "Previous Day Delivery",  address: "7433 LA Ct, Los Angeles, CA 90056", role: 2},


              #Phamacies X Couriers
              %Scriptdrop.Logistic.PharmaCourier{id: -3, provider_id: -5, courier_id: -2, active: true},
              %Scriptdrop.Logistic.PharmaCourier{id: -2, provider_id: -4, courier_id: -2, active: true},
              %Scriptdrop.Logistic.PharmaCourier{id: -1, provider_id: -3, courier_id: -1, active: true},

              #Users
              %Scriptdrop.Accounts.User{id: -2,  email: "amf.paulo.official@gmail.com", provider_id: -5},
              %Scriptdrop.Accounts.User{id: -1,  email: "myhikingdog@gmail.com", provider_id: -2 },

            ]


Enum.each(seed_data, fn(data) ->
  Repo.insert!(data)
end)
