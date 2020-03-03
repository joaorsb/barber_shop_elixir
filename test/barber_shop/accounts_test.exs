defmodule BarberShop.AccountsTest do
  use BarberShop.DataCase

  alias BarberShop.Accounts

  describe "admins" do
    alias BarberShop.Accounts.Admin
    alias BarberShop.Accounts.AdminEnum

    @valid_attrs %{
      email: "some email",
      password: "some password",
      username: "some username",
      status: :active
    }
    @update_attrs %{
      email: "some updated email",
      password: "some updated password",
      username: "some updated username",
      status: :active
    }
    @invalid_attrs %{email: nil, password: nil, username: nil, status: :inactive}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Accounts.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Accounts.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Accounts.create_admin(@valid_attrs)
      assert admin.email == "some email"
      assert admin.password == "some password"
      assert admin.username == "some username"
      assert admin.status == :active
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{} = admin} = Accounts.update_admin(admin, @update_attrs)
      assert admin.email == "some updated email"
      assert admin.password == "some updated password"
      assert admin.username == "some updated username"
      assert admin.status == :active
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_admin(admin, @invalid_attrs)
      assert admin == Accounts.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Accounts.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Accounts.change_admin(admin)
    end
  end
end
