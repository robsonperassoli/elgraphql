defmodule ElgraphqlWeb.Router do
  use ElgraphqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElgraphqlWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
  end

  forward "/api", Absinthe.Plug,
    schema: ElgraphqlWeb.Schema
  
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: ElgraphqlWeb.Schema
end
