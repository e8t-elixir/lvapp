defmodule LiveAppWeb.UserSessionController do
  use LiveAppWeb, :controller

  alias LiveApp.PGA
  alias LiveAppWeb.UserAuth

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    with {:ok, user} <- PGA.get_user_by_email_and_password(email, password) do
      UserAuth.log_in_user(conn, user, user_params)
    else
      {:error, :bad_username_or_password} ->
        render(conn, "new.html", error_message: "Invalid e-mail or password")

      {:error, :not_confirmed} ->
        user = PGA.get_user_by_email(email)

        PGA.deliver_user_confirmation_instructions(
          user,
          &Routes.user_confirmation_url(conn, :confirm, &1)
        )

        render(conn, "new.html",
          error_message:
            "Please confirm your email before login. An email confirmation link has been sent to you."
        )
    end

    # if user = PGA.get_user_by_email_and_password(email, password) do
    # else
    #   render(conn, "new.html", error_message: "Invalid e-mail or password")
    # end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end
end
