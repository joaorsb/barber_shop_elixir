defmodule BarberShopWeb.Router do
  use BarberShopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BarberShopWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/admins", AdminController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BarberShopWeb do
  #   pipe_through :api
  # end
end
