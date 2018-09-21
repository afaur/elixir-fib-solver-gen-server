defmodule App do
  @monit_name App.Supervisor
  @monit_opts [strategy: :one_for_one, name: @monit_name]

  use Application
  use Supervision

  alias Fib, as: F

  @doc "Application entrypoint"
  @spec start(atom(), term()) :: {atom(), pid()}
  def start(_type, _args), do: init [%{id: F, start: {F, :start, []}}]
end
