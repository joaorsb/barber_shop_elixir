defmodule BarberShop.Repo do
  use Ecto.Repo,
    otp_app: :barber_shop,
    adapter: Ecto.Adapters.Postgres
end
