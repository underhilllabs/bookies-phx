defmodule Bookies.Repo do
  use Ecto.Repo,
    otp_app: :bookies,
    adapter: Ecto.Adapters.Postgres
end
