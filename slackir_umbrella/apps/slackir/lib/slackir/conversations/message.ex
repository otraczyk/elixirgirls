defmodule Slackir.Conversations.Message do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "messages" do
    field :message, :string
    field :name, :string
    belongs_to :room, Slackir.Conversations.Room

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :message, :room_id])
    |> validate_required([:name, :message])
  end
end
