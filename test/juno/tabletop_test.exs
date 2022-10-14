defmodule Juno.TabletopTest do
  use Juno.DataCase

  alias Juno.Tabletop

  describe "entities" do
    alias Juno.Tabletop.Entity

    import Juno.TabletopFixtures

    @invalid_attrs %{damage: nil, health: nil, name: nil}

    test "list_entities/0 returns all entities" do
      entity = entity_fixture()
      assert Tabletop.list_entities() == [entity]
    end

    test "get_entity!/1 returns the entity with given id" do
      entity = entity_fixture()
      assert Tabletop.get_entity!(entity.id) == entity
    end

    test "create_entity/1 with valid data creates a entity" do
      valid_attrs = %{damage: 42, health: 42, name: "some name"}

      assert {:ok, %Entity{} = entity} = Tabletop.create_entity(valid_attrs)
      assert entity.damage == 42
      assert entity.health == 42
      assert entity.name == "some name"
    end

    test "create_entity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tabletop.create_entity(@invalid_attrs)
    end

    test "update_entity/2 with valid data updates the entity" do
      entity = entity_fixture()
      update_attrs = %{damage: 43, health: 43, name: "some updated name"}

      assert {:ok, %Entity{} = entity} = Tabletop.update_entity(entity, update_attrs)
      assert entity.damage == 43
      assert entity.health == 43
      assert entity.name == "some updated name"
    end

    test "update_entity/2 with invalid data returns error changeset" do
      entity = entity_fixture()
      assert {:error, %Ecto.Changeset{}} = Tabletop.update_entity(entity, @invalid_attrs)
      assert entity == Tabletop.get_entity!(entity.id)
    end

    test "delete_entity/1 deletes the entity" do
      entity = entity_fixture()
      assert {:ok, %Entity{}} = Tabletop.delete_entity(entity)
      assert_raise Ecto.NoResultsError, fn -> Tabletop.get_entity!(entity.id) end
    end

    test "change_entity/1 returns a entity changeset" do
      entity = entity_fixture()
      assert %Ecto.Changeset{} = Tabletop.change_entity(entity)
    end
  end
end
