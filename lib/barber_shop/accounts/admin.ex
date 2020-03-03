import EctoEnum
defenum(AdminEnum, inactive: 0, active: 1)

defmodule BarberShop.Accounts.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :email, :string
    field :password, :string
    field :username, :string
    field :status, AdminEnum, default: 1

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> unique_constraint(:email)
  end
end
