defmodule VideoGrafikart.Router do
  use VideoGrafikart.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/web", VideoGrafikart do
    pipe_through :browser
    get "/", PageController, :index
    get "/failed", JobController, :failed
    post "/failed", JobController, :failed
    delete "/failed", JobController, :failed
  end

  scope "/api", VideoGrafikart do
    post "/sync", VideoController, :sync
    get "/videos/stream", VideoController, :stream
  end

  # Other scopes may use custom stacks.
  # scope "/api", VideoGrafikart do
  #   pipe_through :api
  # end
end
