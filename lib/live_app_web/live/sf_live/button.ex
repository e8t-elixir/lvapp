defmodule LiveAppWeb.SfLive.Button do
  use Surface.Component

  slot default
  prop label, :string
  prop click, :event, required: true
  prop kind, :string, default: "is-info"

  def render(assigns) do
    ~H"""
    <button type="button" class="button {{@kind}}" :on-click={{@click}}>
      <slot>{{@label}}</slot>
    </button>
    """
  end
end
