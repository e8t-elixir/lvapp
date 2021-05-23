defmodule LiveAppWeb.Pow.Messages do
  use Pow.Phoenix.Messages

  # 还要引入 Extension
  use Pow.Extension.Phoenix.Messages,
    extensions: [PowResetPassword, PowEmailConfirmation]

  # 多语言
  import LiveAppWeb.Gettext

  def user_not_authenticated(_conn), do: gettext("You need to sign in to see this page!!!")
end
