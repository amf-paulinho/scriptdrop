defmodule ScriptdropWeb.PharmaCourierControllerTest do
  use ScriptdropWeb.ConnCase

  alias Scriptdrop.Logistic

  @create_attrs %{active: true, courier_id: 42, provider_id: 42}
  @update_attrs %{active: false, courier_id: 43, provider_id: 43}
  @invalid_attrs %{active: nil, courier_id: nil, provider_id: nil}

  def fixture(:pharma_courier) do
    {:ok, pharma_courier} = Logistic.create_pharma_courier(@create_attrs)
    pharma_courier
  end

  describe "index" do
    test "lists all pharmacouriers", %{conn: conn} do
      conn = get(conn, Routes.pharma_courier_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pharmacouriers"
    end
  end

  describe "new pharma_courier" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pharma_courier_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pharma courier"
    end
  end

  describe "create pharma_courier" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pharma_courier_path(conn, :create), pharma_courier: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pharma_courier_path(conn, :show, id)

      conn = get(conn, Routes.pharma_courier_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pharma courier"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pharma_courier_path(conn, :create), pharma_courier: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pharma courier"
    end
  end

  describe "edit pharma_courier" do
    setup [:create_pharma_courier]

    test "renders form for editing chosen pharma_courier", %{conn: conn, pharma_courier: pharma_courier} do
      conn = get(conn, Routes.pharma_courier_path(conn, :edit, pharma_courier))
      assert html_response(conn, 200) =~ "Edit Pharma courier"
    end
  end

  describe "update pharma_courier" do
    setup [:create_pharma_courier]

    test "redirects when data is valid", %{conn: conn, pharma_courier: pharma_courier} do
      conn = put(conn, Routes.pharma_courier_path(conn, :update, pharma_courier), pharma_courier: @update_attrs)
      assert redirected_to(conn) == Routes.pharma_courier_path(conn, :show, pharma_courier)

      conn = get(conn, Routes.pharma_courier_path(conn, :show, pharma_courier))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, pharma_courier: pharma_courier} do
      conn = put(conn, Routes.pharma_courier_path(conn, :update, pharma_courier), pharma_courier: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pharma courier"
    end
  end

  describe "delete pharma_courier" do
    setup [:create_pharma_courier]

    test "deletes chosen pharma_courier", %{conn: conn, pharma_courier: pharma_courier} do
      conn = delete(conn, Routes.pharma_courier_path(conn, :delete, pharma_courier))
      assert redirected_to(conn) == Routes.pharma_courier_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.pharma_courier_path(conn, :show, pharma_courier))
      end
    end
  end

  defp create_pharma_courier(_) do
    pharma_courier = fixture(:pharma_courier)
    %{pharma_courier: pharma_courier}
  end
end
