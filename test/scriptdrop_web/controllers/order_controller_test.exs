defmodule ScriptdropWeb.OrderControllerTest do
  use ScriptdropWeb.ConnCase

  alias Scriptdrop.Operation

  @create_attrs %{pickup_date: ~D[2010-04-17], pickup_time: ~T[14:00:00], status: 42, client_id: 1, courier_id: 1, user_id: 1, delivery_address: "address", use_file_address: true}
  @update_attrs %{pickup_date: ~D[2011-05-18], pickup_time: ~T[15:01:01], status: 43, client_id: 2, courier_id: 2, user_id: 2, delivery_address: "other address", use_file_address: false}
  @invalid_attrs %{pickup_date: nil, pickup_time: nil, status: nil, client_id: nil, courier_id: nil, user_id: nil, delivery_address: nil, use_file_address: nil}

  def fixture(:order) do
    {:ok, order} = Operation.create_order(@create_attrs)
    order
  end

  describe "index" do
    test "lists all orders", %{conn: conn} do
      conn = get(conn, Routes.order_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Orders"
    end
  end

  describe "new order" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.order_path(conn, :new))
      assert html_response(conn, 200) =~ "New Order"
    end
  end

  describe "create order" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.order_path(conn, :create), order: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.order_path(conn, :show, id)

      conn = get(conn, Routes.order_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Order"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.order_path(conn, :create), order: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Order"
    end
  end

  describe "edit order" do
    setup [:create_order]

    test "renders form for editing chosen order", %{conn: conn, order: order} do
      conn = get(conn, Routes.order_path(conn, :edit, order))
      assert html_response(conn, 200) =~ "Edit Order"
    end
  end

  describe "update order" do
    setup [:create_order]

    test "redirects when data is valid", %{conn: conn, order: order} do
      conn = put(conn, Routes.order_path(conn, :update, order), order: @update_attrs)
      assert redirected_to(conn) == Routes.order_path(conn, :show, order)

      conn = get(conn, Routes.order_path(conn, :show, order))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, order: order} do
      conn = put(conn, Routes.order_path(conn, :update, order), order: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Order"
    end
  end

  describe "delete order" do
    setup [:create_order]

    test "deletes chosen order", %{conn: conn, order: order} do
      conn = delete(conn, Routes.order_path(conn, :delete, order))
      assert redirected_to(conn) == Routes.order_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.order_path(conn, :show, order))
      end
    end
  end

  defp create_order(_) do
    order = fixture(:order)
    %{order: order}
  end
end
