defmodule LiveAppWeb.Pow.Routes do
  use Pow.Phoenix.Routes
  # alias LiveAppWeb.Router.Helpers, as: RouterHelpers
  alias LiveAppWeb.Router.Helpers, as: Routes

  def after_sign_out_path(conn), do: Routes.page_path(conn, :index)
end
