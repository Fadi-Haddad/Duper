defmodule Duper.PathFinder do

  use GenServer

  def init(path) do
    DirWalker.start_link(path)
  end
end
