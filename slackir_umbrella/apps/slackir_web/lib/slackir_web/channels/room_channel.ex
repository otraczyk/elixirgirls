defmodule SlackirWeb.RoomChannel do
  use SlackirWeb, :channel

def join("room:" <> room_id, payload, socket) do
  if authorized?(payload) do
    send self(), :after_join
    {:ok, assign(socket, :room_id, room_id)}
  else
    {:error, %{reason: "unauthorized"}}
  end
end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the cur assign(socket, :room_id, room_idrent topic (room:lobby).
  def handle_in("shout", payload, %{assigns: %{room_id: room_id}} = socket) do
    # require IEx; IEx.pry()
    payload2 = Map.put(payload,"room_id", room_id)
    spawn(Slackir.Conversations, :create_message, [payload2])
    broadcast socket, "shout", payload2
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end

end
