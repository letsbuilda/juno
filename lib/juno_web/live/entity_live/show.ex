defmodule JunoWeb.EntityLive.Show do
  use JunoWeb, :live_view

  alias Juno.Tabletop

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:entity, Tabletop.get_entity!(id))}
  end

  defp page_title(:show), do: "Show Entity"
  defp page_title(:edit), do: "Edit Entity"
end
