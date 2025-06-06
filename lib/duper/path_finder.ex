defmodule Duper.PathFinder do

  use GenServer
  @me __MODULE__

## Interface
  def start_link(root) do
    GenServer.start_link(__MODULE__, root, name: @me)
  end
  def next_path() do
    GenServer.call(@me, {:next_path})
  end

## Implementation
  def init(path) do
    DirWalker.start_link(path)
  end
  def handle_call({:next_path}, _from, dir_walker) do
    path = DirWalker.next(dir_walker)
    {:reply, path, dir_walker}
  end

end
