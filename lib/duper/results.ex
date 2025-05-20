defmodule Duper.Results do
  use GenServer

  def init(_) do
    {:ok, %{}}
  end

  def handle_call(:find_duplicates, _from, results) do
    {:reply, hashes_with_more_than_one_path(results), results}
  end

  defp hashes_with_more_than_one_path(results) do
    results
    |> Enum.filter(fn {_hash, path_list} -> length(path_list) >=2 end)
    |> Enum.map(fn {hash, _path_list} -> hash end)
  end

  def handle_cast({:add, path, hash}, results) do
    results = Map.update(results, hash, [path], fn existing -> [path | existing] end)
    {:noreply, results}
  end
end
