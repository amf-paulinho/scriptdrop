defmodule ScriptdropWeb.UserCourierControllerTest do
  use ScriptdropWeb.ConnCase

  alias Scriptdrop.Logistic

  @create_attrs %{active: true, courier_id: 42, user_id: 42}
  @update_attrs %{active: false, courier_id: 43, user_id: 43}
  @invalid_attrs %{active: nil, courier_id: nil, user_id: nil}

  def fixture(:user_courier) do
    {:ok, user_courier} = Logistic.create_user_courier(@create_attrs)
    user_courier
  end

  describe "index" do
    test "lists all usercouriers", %{conn: conn} do
      conn = get(conn, Routes.user_courier_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Usercouriers"
    end
  end

  describe "new user_courier" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_courier_path(conn, :new))
      assert html_response(conn, 200) =~ "New User courier"
    end
  end

  describe "create user_courier" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_courier_path(conn, :create), user_courier: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.user_courier_path(conn, :show, id)

      conn = get(conn, Routes.user_courier_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show User courier"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_courier_path(conn, :create), user_courier: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User courier"
    end
  end

  describe "edit user_courier" do
    setup [:create_user_courier]

    test "renders form for editing chosen user_courier", %{conn: conn, user_courier: user_courier} do
      conn = get(conn, Routes.user_courier_path(conn, :edit, user_courier))
      assert html_response(conn, 200) =~ "Edit User courier"
    end
  end

  describe "update user_courier" do
    setup [:create_user_courier]

    test "redirects when data is valid", %{conn: conn, user_courier: user_courier} do
      conn = put(conn, Routes.user_courier_path(conn, :update, user_courier), user_courier: @update_attrs)
      assert redirected_to(conn) == Routes.user_courier_path(conn, :show, user_courier)

      conn = get(conn, Routes.user_courier_path(conn, :show, user_courier))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, user_courier: user_courier} do
      conn = put(conn, Routes.user_courier_path(conn, :update, user_courier), user_courier: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User courier"
    end
  end

  describe "delete user_courier" do
    setup [:create_user_courier]

    test "deletes chosen user_courier", %{conn: conn, user_courier: user_courier} do
      conn = delete(conn, Routes.user_courier_path(conn, :delete, user_courier))
      assert redirected_to(conn) == Routes.user_courier_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.user_courier_path(conn, :show, user_courier))
      end
    end
  end

  defp create_user_courier(_) do
    user_courier = fixture(:user_courier)
    %{user_courier: user_courier}
  end
end
