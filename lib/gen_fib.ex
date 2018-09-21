defmodule GenFib do
  defmacro __using__(_opts) do
    quote do
      alias __MODULE__, as: MOD
      import Logger,    only: [info: 1]
      import GenServer, only: [start_link: 3, call: 2]

      @doc "Starts the Fib Solver GenServer process"
      @spec start() :: {atom(), pid()}
      def start(), do: start_link(MOD, %{0 => 1, 1 => 1}, [])

      @doc "Runs after start() calls start_link() on self to run the gen server"
      @spec init(cache :: map()) :: {atom(), map()}
      def init(c), do: {:ok, c}

      @doc "Solve fib using the provided input"
      @spec solve(fib :: integer()) :: {atom(), integer()}
      def solve(f), do: call App.first_pid, {:solve, f}
    end
  end
end
