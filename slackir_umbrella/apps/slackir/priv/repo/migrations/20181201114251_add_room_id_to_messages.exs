defmodule Slackir.Repo.Migrations.AddRoomIdToMessages do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      add :room_id, :binary_id
    end
  end
end
