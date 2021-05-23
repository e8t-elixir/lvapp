defmodule LiveAppWeb.UserRegistrationController do
  use LiveAppWeb, :controller

  alias LiveApp.PGA
  alias LiveApp.PGA.User
  alias LiveAppWeb.UserAuth

  def new(conn, _params) do
    changeset = PGA.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case PGA.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          PGA.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :confirm, &1)
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
