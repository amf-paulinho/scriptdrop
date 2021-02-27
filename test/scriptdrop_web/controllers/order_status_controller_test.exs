defmodule ScriptdropWeb.OrderStatusControllerTest do
  use ScriptdropWeb.ConnCase

  alias Scriptdrop.Global

  @create_attrs %{description: "some description"}
  @update_attrs %{description: "some updated description"}
  @invalid_attrs %{description: nil}

  def fixture(:order_status) do
    {:ok, order_status} = Global.create_order_status(@create_attrs)
    order_status
  end

  describe "index" do
    test "lists all orderstatuses", %{conn: conn} do
      conn = get(conn, Routes.order_status_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Orderstatuses"
    end
  end

  describe "new order_status" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.order_status_path(conn, :new))
      assert html_response(conn, 200) =~ "New Order status"
    end
  end

  describe "create order_status" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.order_status_path(conn, :create), order_status: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.order_status_path(conn, :show, id)

      conn = get(conn, Routes.order_status_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Order status"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.order_status_path(conn, :create), order_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Order status"
    end
  end

  describe "edit order_status" do
    setup [:create_order_status]

    test "renders form for editing chosen order_status", %{conn: conn, order_status: order_status} do
      conn = get(conn, Routes.order_status_path(conn, :edit, order_status))
      assert html_response(conn, 200) =~ "Edit Order status"
    end
  end

  describe "update order_status" do
    setup [:create_order_status]

    test "redirects when data is valid", %{conn: conn, order_status: order_status} do
      conn = put(conn, Routes.order_status_path(conn, :update, order_status), order_status: @update_attrs)
      assert redirected_to(conn) == Routes.order_status_path(conn, :show, order_status)

      conn = get(conn, Routes.order_status_path(conn, :show, order_status))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, order_status: order_status} do
      conn = put(conn, Routes.order_status_path(conn, :update, order_status), order_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Order status"
    end
  end

  describe "delete order_status" do
    setup [:create_order_status]

    test "deletes chosen order_status", %{conn: conn, order_status: order_status} do
      conn = delete(conn, Routes.order_status_path(conn, :delete, order_status))
      assert redirected_to(conn) == Routes.order_status_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.order_status_path(conn, :show, order_status))
      end
    end
  end

  defp create_order_status(_) do
    order_status = fixture(:order_status)
    %{order_status: order_status}
  end
end
