defmodule Juno.Tabletop.Entity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entities" do
    field :damage, :integer
    field :health, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [:name, :health, :damage])
    |> validate_required([:name, :health, :damage])
  end
end
