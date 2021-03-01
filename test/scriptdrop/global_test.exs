defmodule Scriptdrop.GlobalTest do
  use Scriptdrop.DataCase

  alias Scriptdrop.Global

  describe "drugs" do
    alias Scriptdrop.Global.Drug

    @valid_attrs %{description: "some description", unit: "some unit", qty: 1, price: 1}
    @update_attrs %{description: "some updated description", unit: "some updated unit", qty: 2, price: 2}
    @invalid_attrs %{description: nil, unit: nil, qty: nil, price: nil}

    def drug_fixture(attrs \\ %{}) do
      {:ok, drug} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Global.create_drug()

      drug
    end

    test "list_drugs/0 returns all drugs" do
      drug = drug_fixture()
      assert Global.list_drugs() == [drug]
    end

    test "get_drug!/1 returns the drug with given id" do
      drug = drug_fixture()
      assert Global.get_drug!(drug.id) == drug
    end

    test "create_drug/1 with valid data creates a drug" do
      assert {:ok, %Drug{} = drug} = Global.create_drug(@valid_attrs)
      assert drug.description == "some description"
      assert drug.unit == "some unit"
    end

    test "create_drug/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Global.create_drug(@invalid_attrs)
    end

    test "update_drug/2 with valid data updates the drug" do
      drug = drug_fixture()
      assert {:ok, %Drug{} = drug} = Global.update_drug(drug, @update_attrs)
      assert drug.description == "some updated description"
      assert drug.unit == "some updated unit"
    end

    test "update_drug/2 with invalid data returns error changeset" do
      drug = drug_fixture()
      assert {:error, %Ecto.Changeset{}} = Global.update_drug(drug, @invalid_attrs)
      assert drug == Global.get_drug!(drug.id)
    end

    test "delete_drug/1 deletes the drug" do
      drug = drug_fixture()
      assert {:ok, %Drug{}} = Global.delete_drug(drug)
      assert_raise Ecto.NoResultsError, fn -> Global.get_drug!(drug.id) end
    end

    test "change_drug/1 returns a drug changeset" do
      drug = drug_fixture()
      assert %Ecto.Changeset{} = Global.change_drug(drug)
    end
  end

  describe "clients" do
    alias Scriptdrop.Global.Client

    @valid_attrs %{address: "some address", name: "some name"}
    @update_attrs %{address: "some updated address", name: "some updated name"}
    @invalid_attrs %{address: nil, name: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Global.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Global.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Global.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Global.create_client(@valid_attrs)
      assert client.address == "some address"
      assert client.name == "some name"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Global.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, %Client{} = client} = Global.update_client(client, @update_attrs)
      assert client.address == "some updated address"
      assert client.name == "some updated name"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Global.update_client(client, @invalid_attrs)
      assert client == Global.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Global.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Global.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Global.change_client(client)
    end
  end

  describe "orderstatuses" do
    alias Scriptdrop.Global.OrderStatus

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def order_status_fixture(attrs \\ %{}) do
      {:ok, order_status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Global.create_order_status()

      order_status
    end

    test "list_orderstatuses/0 returns all orderstatuses" do
      order_status = order_status_fixture()
      assert Global.list_orderstatuses() == [order_status]
    end

    test "get_order_status!/1 returns the order_status with given id" do
      order_status = order_status_fixture()
      assert Global.get_order_status!(order_status.id) == order_status
    end

    test "create_order_status/1 with valid data creates a order_status" do
      assert {:ok, %OrderStatus{} = order_status} = Global.create_order_status(@valid_attrs)
      assert order_status.description == "some description"
    end

    test "create_order_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Global.create_order_status(@invalid_attrs)
    end

    test "update_order_status/2 with valid data updates the order_status" do
      order_status = order_status_fixture()
      assert {:ok, %OrderStatus{} = order_status} = Global.update_order_status(order_status, @update_attrs)
      assert order_status.description == "some updated description"
    end

    test "update_order_status/2 with invalid data returns error changeset" do
      order_status = order_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Global.update_order_status(order_status, @invalid_attrs)
      assert order_status == Global.get_order_status!(order_status.id)
    end

    test "delete_order_status/1 deletes the order_status" do
      order_status = order_status_fixture()
      assert {:ok, %OrderStatus{}} = Global.delete_order_status(order_status)
      assert_raise Ecto.NoResultsError, fn -> Global.get_order_status!(order_status.id) end
    end

    test "change_order_status/1 returns a order_status changeset" do
      order_status = order_status_fixture()
      assert %Ecto.Changeset{} = Global.change_order_status(order_status)
    end
  end
end
