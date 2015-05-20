defmodule Sequence.Server do
  use GenServer

  def handle_call(:next_number , _from, current_number) do
    {:reply, current_number, current_number+1}
  end
  
end


defmodule Sequence.Stack do
  use GenServer

  ## client api
  def start_link(init_stack) do
    GenServer.start_link __MODULE__, init_stack, name: __MODULE__
  end
  
  def pop() do
    GenServer.call __MODULE__, :pop
  end
  
  def push(value) do
    GenServer.cast __MODULE__, {:push, value}
  end


  ##server callbacks
  def handle_call(:pop , _from, [h|t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, value} , stack) do
    {:noreply, [value|stack]}
  end

  def terminate(reason, _state) do
    IO.puts "Terminate #{inspect reason}"
  end

end