defmodule Supervision do
  defmacro __using__(_opts) do
    quote do
      import Supervisor, only: [which_children: 1]

      @doc "Define delegate to Supervisor.start_link"
      @spec supervise(children :: list(), options :: %{}) :: {atom(), pid()}
      defdelegate supervise(children, options), to: Supervisor, as: :start_link

      @doc "Create a supervisor to watch processess"
      @spec init(children :: list()) :: {atom(), pid()}
      def init(children), do: supervise children, @monit_opts

      @doc "Returns details about processes the supervisor is monitoring"
      @spec inspect() :: [{module(), pid(), atom(), [module()]}]
      def inspect(), do: which_children @monit_name

      @doc "Returns the pid of the first supervised process"
      @spec first_pid() :: pid()
      def first_pid(), do: elem hd(inspect()), 1
    end
  end
end
