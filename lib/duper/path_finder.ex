defmodule Duper.PathFinder do

  use GenServer

## Implementation
  def init(path) do
    DirWalker.start_link(path)
  end
  def handle_call({:next_path}, _from, dir_walker) do
    path = dir_walker.next(dir_walker)
    {:reply, path, dir_walker}
  end

end
