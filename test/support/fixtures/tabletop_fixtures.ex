defmodule Juno.TabletopFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Juno.Tabletop` context.
  """

  @doc """
  Generate a entity.
  """
  def entity_fixture(attrs \\ %{}) do
    {:ok, entity} =
      attrs
      |> Enum.into(%{
        damage: 42,
        health: 42,
        name: "some name"
      })
      |> Juno.Tabletop.create_entity()

    entity
  end
end
