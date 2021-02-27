defmodule Scriptdrop.LogisticTest do
  use Scriptdrop.DataCase

  alias Scriptdrop.Logistic

  describe "usercouriers" do
    alias Scriptdrop.Logistic.UserCourier

    @valid_attrs %{active: true, courier_id: 42, user_id: 42}
    @update_attrs %{active: false, courier_id: 43, user_id: 43}
    @invalid_attrs %{active: nil, courier_id: nil, user_id: nil}

    def user_courier_fixture(attrs \\ %{}) do
      {:ok, user_courier} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logistic.create_user_courier()

      user_courier
    end

    test "list_usercouriers/0 returns all usercouriers" do
      user_courier = user_courier_fixture()
      assert Logistic.list_usercouriers() == [user_courier]
    end

    test "get_user_courier!/1 returns the user_courier with given id" do
      user_courier = user_courier_fixture()
      assert Logistic.get_user_courier!(user_courier.id) == user_courier
    end

    test "create_user_courier/1 with valid data creates a user_courier" do
      assert {:ok, %UserCourier{} = user_courier} = Logistic.create_user_courier(@valid_attrs)
      assert user_courier.active == true
      assert user_courier.courier_id == 42
      assert user_courier.user_id == 42
    end

    test "create_user_courier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logistic.create_user_courier(@invalid_attrs)
    end

    test "update_user_courier/2 with valid data updates the user_courier" do
      user_courier = user_courier_fixture()
      assert {:ok, %UserCourier{} = user_courier} = Logistic.update_user_courier(user_courier, @update_attrs)
      assert user_courier.active == false
      assert user_courier.courier_id == 43
      assert user_courier.user_id == 43
    end

    test "update_user_courier/2 with invalid data returns error changeset" do
      user_courier = user_courier_fixture()
      assert {:error, %Ecto.Changeset{}} = Logistic.update_user_courier(user_courier, @invalid_attrs)
      assert user_courier == Logistic.get_user_courier!(user_courier.id)
    end

    test "delete_user_courier/1 deletes the user_courier" do
      user_courier = user_courier_fixture()
      assert {:ok, %UserCourier{}} = Logistic.delete_user_courier(user_courier)
      assert_raise Ecto.NoResultsError, fn -> Logistic.get_user_courier!(user_courier.id) end
    end

    test "change_user_courier/1 returns a user_courier changeset" do
      user_courier = user_courier_fixture()
      assert %Ecto.Changeset{} = Logistic.change_user_courier(user_courier)
    end
  end

  describe "providers" do
    alias Scriptdrop.Logistic.Provider

    @valid_attrs %{address: "some address", name: "some name", role: 42}
    @update_attrs %{address: "some updated address", name: "some updated name", role: 43}
    @invalid_attrs %{address: nil, name: nil, role: nil}

    def provider_fixture(attrs \\ %{}) do
      {:ok, provider} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logistic.create_provider()

      provider
    end

    test "list_providers/0 returns all providers" do
      provider = provider_fixture()
      assert Logistic.list_providers() == [provider]
    end

    test "get_provider!/1 returns the provider with given id" do
      provider = provider_fixture()
      assert Logistic.get_provider!(provider.id) == provider
    end

    test "create_provider/1 with valid data creates a provider" do
      assert {:ok, %Provider{} = provider} = Logistic.create_provider(@valid_attrs)
      assert provider.address == "some address"
      assert provider.name == "some name"
      assert provider.role == 42
    end

    test "create_provider/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logistic.create_provider(@invalid_attrs)
    end

    test "update_provider/2 with valid data updates the provider" do
      provider = provider_fixture()
      assert {:ok, %Provider{} = provider} = Logistic.update_provider(provider, @update_attrs)
      assert provider.address == "some updated address"
      assert provider.name == "some updated name"
      assert provider.role == 43
    end

    test "update_provider/2 with invalid data returns error changeset" do
      provider = provider_fixture()
      assert {:error, %Ecto.Changeset{}} = Logistic.update_provider(provider, @invalid_attrs)
      assert provider == Logistic.get_provider!(provider.id)
    end

    test "delete_provider/1 deletes the provider" do
      provider = provider_fixture()
      assert {:ok, %Provider{}} = Logistic.delete_provider(provider)
      assert_raise Ecto.NoResultsError, fn -> Logistic.get_provider!(provider.id) end
    end

    test "change_provider/1 returns a provider changeset" do
      provider = provider_fixture()
      assert %Ecto.Changeset{} = Logistic.change_provider(provider)
    end
  end

  describe "pharmacouriers" do
    alias Scriptdrop.Logistic.PharmaCourier

    @valid_attrs %{active: true, courier_id: 42, provider_id: 42}
    @update_attrs %{active: false, courier_id: 43, provider_id: 43}
    @invalid_attrs %{active: nil, courier_id: nil, provider_id: nil}

    def pharma_courier_fixture(attrs \\ %{}) do
      {:ok, pharma_courier} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logistic.create_pharma_courier()

      pharma_courier
    end

    test "list_pharmacouriers/0 returns all pharmacouriers" do
      pharma_courier = pharma_courier_fixture()
      assert Logistic.list_pharmacouriers() == [pharma_courier]
    end

    test "get_pharma_courier!/1 returns the pharma_courier with given id" do
      pharma_courier = pharma_courier_fixture()
      assert Logistic.get_pharma_courier!(pharma_courier.id) == pharma_courier
    end

    test "create_pharma_courier/1 with valid data creates a pharma_courier" do
      assert {:ok, %PharmaCourier{} = pharma_courier} = Logistic.create_pharma_courier(@valid_attrs)
      assert pharma_courier.active == true
      assert pharma_courier.courier_id == 42
      assert pharma_courier.provider_id == 42
    end

    test "create_pharma_courier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logistic.create_pharma_courier(@invalid_attrs)
    end

    test "update_pharma_courier/2 with valid data updates the pharma_courier" do
      pharma_courier = pharma_courier_fixture()
      assert {:ok, %PharmaCourier{} = pharma_courier} = Logistic.update_pharma_courier(pharma_courier, @update_attrs)
      assert pharma_courier.active == false
      assert pharma_courier.courier_id == 43
      assert pharma_courier.provider_id == 43
    end

    test "update_pharma_courier/2 with invalid data returns error changeset" do
      pharma_courier = pharma_courier_fixture()
      assert {:error, %Ecto.Changeset{}} = Logistic.update_pharma_courier(pharma_courier, @invalid_attrs)
      assert pharma_courier == Logistic.get_pharma_courier!(pharma_courier.id)
    end

    test "delete_pharma_courier/1 deletes the pharma_courier" do
      pharma_courier = pharma_courier_fixture()
      assert {:ok, %PharmaCourier{}} = Logistic.delete_pharma_courier(pharma_courier)
      assert_raise Ecto.NoResultsError, fn -> Logistic.get_pharma_courier!(pharma_courier.id) end
    end

    test "change_pharma_courier/1 returns a pharma_courier changeset" do
      pharma_courier = pharma_courier_fixture()
      assert %Ecto.Changeset{} = Logistic.change_pharma_courier(pharma_courier)
    end
  end
end
