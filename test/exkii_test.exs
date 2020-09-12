defmodule ExkiiTest do
  use ExUnit.Case
  doctest Exkii

  test "greets the world" do
    assert Exkii.hello() == :world
  end
end
