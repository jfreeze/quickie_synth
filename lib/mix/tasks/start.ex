defmodule Mix.Tasks.Start do
  use Mix.Task

  @shortdoc "Run UI.start"
  def run(_) do
    QuickieSynth.UI.start
  end
end
