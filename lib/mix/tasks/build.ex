defmodule Mix.Tasks.Build do
  use Mix.Task

  @shortdoc "Build QuickieSynth script"
  def run(_) do
    {result, _error_code} = System.cmd("mix", ["escript.build"], stderr_to_stdout: true)
    Mix.shell.info result
  end
end
