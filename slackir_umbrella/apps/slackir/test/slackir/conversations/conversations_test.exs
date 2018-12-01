defmodule Slackir.ConversationsTest do
  use Slackir.DataCase

  alias Slackir.Conversations

  describe "messages" do
    alias Slackir.Conversations.Message

    @valid_attrs %{message: "some message", name: "some name"}
    @update_attrs %{message: "some updated message", name: "some updated name"}
    @invalid_attrs %{message: nil, name: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Conversations.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Conversations.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Conversations.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Conversations.create_message(@valid_attrs)
      assert message.message == "some message"
      assert message.name == "some name"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conversations.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, %Message{} = message} = Conversations.update_message(message, @update_attrs)
      assert message.message == "some updated message"
      assert message.name == "some updated name"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Conversations.update_message(message, @invalid_attrs)
      assert message == Conversations.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Conversations.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Conversations.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Conversations.change_message(message)
    end
  end

  describe "rooms" do
    alias Slackir.Conversations.Room

    @valid_attrs %{name: "some name", password: "some password"}
    @update_attrs %{name: "some updated name", password: "some updated password"}
    @invalid_attrs %{name: nil, password: nil}

    def room_fixture(attrs \\ %{}) do
      {:ok, room} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Conversations.create_room()

      room
    end

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Conversations.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Conversations.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      assert {:ok, %Room{} = room} = Conversations.create_room(@valid_attrs)
      assert room.name == "some name"
      assert room.password == "some password"
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conversations.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      assert {:ok, %Room{} = room} = Conversations.update_room(room, @update_attrs)
      assert room.name == "some updated name"
      assert room.password == "some updated password"
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Conversations.update_room(room, @invalid_attrs)
      assert room == Conversations.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Conversations.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Conversations.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Conversations.change_room(room)
    end
  end
end
