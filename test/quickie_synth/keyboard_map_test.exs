defmodule QuickieSynth.KeyboardMapTest do
  use ExUnit.Case

  test "bottom row" do
    assert_map("z", "G")
    assert_map("x", "A")
    assert_map("c", "B")
    assert_map("v", "C")
    assert_map("b", "D")
    assert_map("n", "E")
    assert_map("m", "F")
    assert_map(",", "G")
  end

  test "second row" do
    assert_map("s", "G#")
    assert_map("d", "A#")
    assert_map("f", "B#")
    assert_map("g", "C#")
    assert_map("h", "D#")
    assert_map("j", "E#")
    assert_map("k", "F#")
    assert_map("l", "G#")
  end

  test "unmapped keys" do
    assert_map("q", :nomap)
  end

  defp assert_map(key, note) do
    assert QuickieSynth.KeyboardMap.note_for(key) == note
  end
end
