defmodule ScriptdropWeb.Router do
  use ScriptdropWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    #plug :fetch_flash
    plug :fetch_live_flash
    plug :put_root_layout, {ScriptdropWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Scriptdrop.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ScriptdropWeb do
    pipe_through :browser

    #live "/live", PageLive, :index

    get "/", PageController, :index
    get "/about", PageController, :about

    resources "/users", UserController
    resources "/clients", ClientController
    resources "/orders", OrderController
    resources "/orderitems", OrderItemController
    resources "/drugs", DrugController
    resources "/orderstatuses", OrderStatusController
    resources "/providers", ProviderController
    resources "/pharmacouriers", PharmaCourierController

    get "/orderitems/:id/new", OrderItemController, :new

  end

  scope "/auth", ScriptdropWeb do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback

  end

  # Other scopes may use custom stacks.
  # scope "/api", ScriptdropWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ScriptdropWeb.Telemetry
    end
  end
end
