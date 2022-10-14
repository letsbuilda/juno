defmodule Juno.Repo.Migrations.CreateEntities do
  use Ecto.Migration

  def change do
    create table(:entities) do
      add :name, :string
      add :health, :integer
      add :damage, :integer

      timestamps()
    end
  end
end
