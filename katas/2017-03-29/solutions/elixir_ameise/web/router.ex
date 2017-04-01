defmodule Ameise.Router do
  use Ameise.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Ameise do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/reset", PageController, :reset
  end
end
