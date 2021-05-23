defmodule LiveAppWeb.Pow.Mailer do
  use Pow.Phoenix.Mailer
  require Logger

  def cast(%{user: user, subject: subject, text: text, html: html, assigns: _assigns}) do
    # mail struct 
    %{to: user.email, subject: subject, text: text, html: html}
  end

  def process(email) do
    # mock: send email
    Logger.debug("E-mail sent: #{inspect(email)}")
  end
end
