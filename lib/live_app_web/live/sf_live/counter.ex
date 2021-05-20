defmodule LiveAppWeb.SfLive.Counter do
  use Surface.LiveComponent

  alias LiveAppWeb.SfLive.Button

  data count, :integer, default: 0

  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("clear", _, socket) do
    {:noreply, assign(socket, :count, 0)}
  end
end
