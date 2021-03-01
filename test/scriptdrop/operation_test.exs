defmodule Scriptdrop.OperationTest do
  use Scriptdrop.DataCase

  alias Scriptdrop.Operation

  describe "orders" do
    alias Scriptdrop.Operation.Order



    @valid_attrs %{pickup_date: ~D[2010-04-17], pickup_time: ~T[14:00:00], status: 42, client_id: 1, courier_id: 1, user_id: 1, delivery_address: "address", use_file_address: true}
    @update_attrs %{pickup_date: ~D[2011-05-18], pickup_time: ~T[15:01:01], status: 43, client_id: 2, courier_id: 2, user_id: 2, delivery_address: "other address", use_file_address: false}
    @invalid_attrs %{pickup_date: nil, pickup_time: nil, status: nil, client_id: nil, courier_id: nil, user_id: nil, delivery_address: nil, use_file_address: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Operation.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Operation.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Operation.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Operation.create_order(@valid_attrs)
      assert order.pickup_date == ~D[2010-04-17]
      assert order.pickup_time == ~T[14:00:00]
      assert order.status == 42
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Operation.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Operation.update_order(order, @update_attrs)
      assert order.pickup_date == ~D[2011-05-18]
      assert order.pickup_time == ~T[15:01:01]
      assert order.status == 43
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Operation.update_order(order, @invalid_attrs)
      assert order == Operation.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Operation.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Operation.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Operation.change_order(order)
    end
  end

  describe "orderitems" do
    alias Scriptdrop.Operation.OrderItem

    @valid_attrs %{qty: 42, drug_id: 1, order_id: 1, price: 1}
    @update_attrs %{qty: 43, drug_id: 2, order_id: 2, price: 2}
    @invalid_attrs %{qty: nil, drug_id: nil, order_id: nil, price: nil}

    def order_item_fixture(attrs \\ %{}) do
      {:ok, order_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Operation.create_order_item()

      order_item
    end

    test "list_orderitems/0 returns all orderitems" do
      order_item = order_item_fixture()
      assert Operation.list_orderitems(1) == [order_item]
    end

    test "get_order_item!/1 returns the order_item with given id" do
      order_item = order_item_fixture()
      assert Operation.get_order_item!(order_item.id) == order_item
    end

    test "create_order_item/1 with valid data creates a order_item" do
      assert {:ok, %OrderItem{} = order_item} = Operation.create_order_item(@valid_attrs)
      assert order_item.qty == 42
    end

    test "create_order_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Operation.create_order_item(@invalid_attrs)
    end

    test "update_order_item/2 with valid data updates the order_item" do
      order_item = order_item_fixture()
      assert {:ok, %OrderItem{} = order_item} = Operation.update_order_item(order_item, @update_attrs)
      assert order_item.qty == 43
    end

    test "update_order_item/2 with invalid data returns error changeset" do
      order_item = order_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Operation.update_order_item(order_item, @invalid_attrs)
      assert order_item == Operation.get_order_item!(order_item.id)
    end

    test "delete_order_item/1 deletes the order_item" do
      order_item = order_item_fixture()
      assert {:ok, %OrderItem{}} = Operation.delete_order_item(order_item)
      assert_raise Ecto.NoResultsError, fn -> Operation.get_order_item!(order_item.id) end
    end

    test "change_order_item/1 returns a order_item changeset" do
      order_item = order_item_fixture()
      assert %Ecto.Changeset{} = Operation.change_order_item(order_item)
    end
  end
end
