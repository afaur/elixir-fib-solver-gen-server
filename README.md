## Project Overview
  - Fibonacci number solver that operates as a process using GenServer
  - The Fibonacci Solver is started and monitored by a supervisor
  - Initial state cache contains a map of %{0 => 1, 1 => 1}
  - It builds up answers as it decrements the provided input until reaching 2
  - It caches the solved result and all answers it solved to figure it out

## Benefits from Erlang
  - Has one integer type and supports big integers, large numbers are computed
      without any additional logic in our implementation.
  - Map type in state will handle big integers as values.
  - Pattern matching and function overloading add simplicity.
  - Using a supervisor to monitor the fib process, it is restarted if it dies.
  - Able to use genserver to implement state, and messaging from other processes.

## Possible Enhancements
  ### Current Functionality
    If it knows the answer (from cache) it is provided instantly.
  ### Possible Enhancement
    Use the largest answer it already knows to help solve new unknown fibs.

  ### Current Functionality
    Caches a map %{input => result} of all known values.
  ### Possible Enhancement
    Setting a range used to qualify if it should cache a result.
    This would minimize the memory footprint by storing less items.

  ### Current Functionality
    Right now the cache is stored as long as the process has not died.
  ### Possible Enhancement
    Option for if a value should leave after no cache hit in a duration.

## Instructions
```
iex -S mix run
```

## Example Output
```
iex -S mix run
Erlang/OTP 21 [erts-10.0.7] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe] [dtrace]
Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> Fib.solve 5
{:ok, 5}

iex(2)> Fib.solve 50
{:ok, 12586269025}

iex(3)> Fib.solve 500
{:ok,
 139423224561697880139724382870407283950070256587697307264108962948325571622863290691557658876222521294125}

iex(4)> Fib.solve 5000
{:ok,
 3878968454388325633701916308325905312082127714646245106160597214895550139044037097010822916462210669479293452858882973813483102008954982940361430156911478938364216563944106910214505634133706558656238254656700712525929903854933813928836378347518908762970712033337052923107693008518093849801803847813996748881765554653788291644268912980384613778969021502293082475666346224923071883324803280375039130352903304505842701147635242270210934637699104006714174883298422891491273104054328753298044273676822977244987749874555691907703880637046832794811358973739993110106219308149018570815397854379195305617510761053075688783766033667355445258844886241619210553457493675897849027988234351023599844663934853256411952221859563060475364645470760330902420806382584929156452876291575759142343809142302917491088984155209854432486594079793571316841692868039545309545388698114665082066862897420639323438488465240988742395873801976993820317174208932265468879364002630797780058759129671389634214252579116872755600360311370547754724604639987588046985178408674382863125}
```
