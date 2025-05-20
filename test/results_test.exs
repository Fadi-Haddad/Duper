defmodule DuperTest do
  use ExUnit.Case
  doctest Duper
  alias Duper.Results

  test "adding path to a hash" do
    Results.add_hash_for("path1", 111)
    Results.add_hash_for("path2", 222)
    Results.add_hash_for("path3", 333)
    Results.add_hash_for("path4", 111)
    Results.add_hash_for("path5", 222)

    duplicates  = Results.find_duplicates()

    assert duplicates |> length() == 2
    assert 111 in duplicates
    assert 222 in duplicates

  end
end
