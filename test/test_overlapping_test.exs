defmodule TestOverlappingTest do
  use ExUnit.Case
  doctest TestOverlapping

  @tag timeout: :infinity
  test "mix dialyzer" do
    Mix.Tasks.Dialyzer.run([])
  end
end
