defmodule CountingValleysTest do
  use ExUnit.Case
  doctest CountingValleys

  test "one valley only" do
    assert CountingValleys.count(8, "DDUUUUDD") == 1
  end

  test "a valley after a mountain" do
    assert CountingValleys.count(8, "UDDDUDUU") == 1
  end

  test "just a mountain" do
    assert CountingValleys.count(8, "UUUUDDDD") == 0
  end

  test "a valley, a mountain and a valley again" do
    assert CountingValleys.count(8, "DUUDDU") == 2
  end
end
