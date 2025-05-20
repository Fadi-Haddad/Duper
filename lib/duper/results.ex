defmodule Duper.Results do
  use GenServer

  def init(_) do
    {:ok, %{}}
  end
  def handle_call(:find_duplicates, _from, results) do
    {:reply, hashes_with_more_than_one_path(results), results}
  end


end
