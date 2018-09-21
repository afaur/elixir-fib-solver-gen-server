defmodule Fib do
  use GenFib
  @doc "Solve fib using the provided input"
  @spec handle_call({atom(), integer()}, pid(), map()) :: {atom(), {atom(), integer()}, map()}
  def handle_call({:solve, number}, _from, state) do
    case Map.fetch state, number do
      {:ok, result}  -> {:reply, {:ok, result}, state}
      _              -> fib state, 1, 1, number, number
    end
  end

  # When number variable reaches 2 we can reply with the built up answer in memo
  defp fib(state, memo, _acc, 2, _initial), do: {:reply, {:ok, memo}, state}

  # Builds up answers inside of memo while reducing number
  defp fib(state, memo, acc, number, initial) do
    # Cache a solved fib in state
    state = Map.put state, (initial - (number-1)), acc
    # Call back to ourself until number == 2 causing other fn pattern to match
    fib state, memo+acc, memo, number-1, initial
  end
end
