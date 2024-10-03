defmodule Beddiaful.Repo do
  use Ecto.Repo,
    otp_app: :beddiaful,
    adapter: Ecto.Adapters.Postgres
end
