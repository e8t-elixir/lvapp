defmodule LiveAppWeb.SfLive.Index do
  use LiveAppWeb, :live_view

  # @impl true
  # def render(assigns) do
  #   ~L"""
  #   Using Surface <%= @version %>
  #   """
  # end

  @impl true
  def mount(_params, _session, socket) do
    version = '0.0.1'
    {:ok, assign(socket, :version, version)}
  end
end
