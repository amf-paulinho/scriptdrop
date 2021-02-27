defmodule ScriptdropWeb.DrugControllerTest do
  use ScriptdropWeb.ConnCase

  alias Scriptdrop.Global

  @create_attrs %{description: "some description", unit: "some unit"}
  @update_attrs %{description: "some updated description", unit: "some updated unit"}
  @invalid_attrs %{description: nil, unit: nil}

  def fixture(:drug) do
    {:ok, drug} = Global.create_drug(@create_attrs)
    drug
  end

  describe "index" do
    test "lists all drugs", %{conn: conn} do
      conn = get(conn, Routes.drug_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Drugs"
    end
  end

  describe "new drug" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.drug_path(conn, :new))
      assert html_response(conn, 200) =~ "New Drug"
    end
  end

  describe "create drug" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.drug_path(conn, :create), drug: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.drug_path(conn, :show, id)

      conn = get(conn, Routes.drug_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Drug"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.drug_path(conn, :create), drug: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Drug"
    end
  end

  describe "edit drug" do
    setup [:create_drug]

    test "renders form for editing chosen drug", %{conn: conn, drug: drug} do
      conn = get(conn, Routes.drug_path(conn, :edit, drug))
      assert html_response(conn, 200) =~ "Edit Drug"
    end
  end

  describe "update drug" do
    setup [:create_drug]

    test "redirects when data is valid", %{conn: conn, drug: drug} do
      conn = put(conn, Routes.drug_path(conn, :update, drug), drug: @update_attrs)
      assert redirected_to(conn) == Routes.drug_path(conn, :show, drug)

      conn = get(conn, Routes.drug_path(conn, :show, drug))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, drug: drug} do
      conn = put(conn, Routes.drug_path(conn, :update, drug), drug: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Drug"
    end
  end

  describe "delete drug" do
    setup [:create_drug]

    test "deletes chosen drug", %{conn: conn, drug: drug} do
      conn = delete(conn, Routes.drug_path(conn, :delete, drug))
      assert redirected_to(conn) == Routes.drug_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.drug_path(conn, :show, drug))
      end
    end
  end

  defp create_drug(_) do
    drug = fixture(:drug)
    %{drug: drug}
  end
end
