defmodule QuickieSynth.KeyboardMap do
  def note_for("z"), do: "G"
  def note_for("x"), do: "A"
  def note_for("c"), do: "B"
  def note_for("v"), do: "C"
  def note_for("b"), do: "D"
  def note_for("n"), do: "E"
  def note_for("m"), do: "F"
  def note_for(","), do: "G"
  def note_for("s"), do: "G#"
  def note_for("d"), do: "A#"
  def note_for("f"), do: "B#"
  def note_for("g"), do: "C#"
  def note_for("h"), do: "D#"
  def note_for("j"), do: "E#"
  def note_for("k"), do: "F#"
  def note_for("l"), do: "G#"

  def note_for(_), do: :nomap

end
