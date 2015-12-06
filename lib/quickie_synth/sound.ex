defmodule QuickieSynth.Sound do
  def command(note) do
    "play -qn synth .2 pluck #{note}"
  end

  def play(note) do
    note |> command |> run
  end

  def run(full_cmd) do
    [cmd | args] = String.split(full_cmd, " ")
    System.cmd(cmd, args)
  end
end
