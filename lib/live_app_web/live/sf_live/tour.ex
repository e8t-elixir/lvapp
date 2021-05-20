defmodule LiveAppWeb.SfLive.Tour do
  use Surface.LiveView
  alias LiveAppWeb.SfLive.{Todo, Counter}

  def render(assigns) do
    ~H"""
    <Todo />
    <Counter id="tour-counter" />
    """
  end
end
