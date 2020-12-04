defmodule OrderSystem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      OrderSystemWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: OrderSystem.PubSub},
      # Start the Endpoint (http/https)
      OrderSystemWeb.Endpoint
      # Start a worker by calling: OrderSystem.Worker.start_link(arg)
      # {OrderSystem.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OrderSystem.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    OrderSystemWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
