defmodule SlackirWeb.PageController do
  use SlackirWeb, :controller

  def index(conn, _params) do
     message_history = Slackir.Conversations.list_messages()
      |> Enum.map(fn(m) -> %{message: m.message, name: m.name, date: m.inserted_at} end)

     rooms = Slackir.Conversations.list_rooms()
      |> Enum.map(fn(r) -> %{name: r.name, id: r.id} end)

     render(conn, "index.html", messages: message_history, rooms: rooms)  # to samo co: [messages: messages])
  end

  def room(conn, %{"id" => room_id} = _params) do
    current_room = Slackir.Conversations.get_room!(room_id)

    message_history = Slackir.Conversations.list_messages_from_room(room_id)
     |> Enum.map(fn(m) -> %{message: m.message, name: m.name, date: m.inserted_at} end)

    rooms = Slackir.Conversations.list_rooms()
      |> Enum.map(fn(r) -> %{name: r.name, id: r.id} end)


    render(conn, "room.html", messages: message_history, rooms: rooms, current_room: current_room)
  end
end
