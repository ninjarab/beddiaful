defmodule Beddiaful.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BeddiafulWeb.Telemetry,
      Beddiaful.Repo,
      {DNSCluster, query: Application.get_env(:beddiaful, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Beddiaful.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Beddiaful.Finch},
      # Start a worker by calling: Beddiaful.Worker.start_link(arg)
      # {Beddiaful.Worker, arg},
      # Start to serve requests, typically the last entry
      BeddiafulWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Beddiaful.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BeddiafulWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
