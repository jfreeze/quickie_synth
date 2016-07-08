defmodule QuickieSynth.Mixfile do
  use Mix.Project

  def project do
    [app: :quickie_synth,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,

     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [mod: {QuickieSynth, []},
     applications: [:ex_ncurses]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_ncurses, git: "https://github.com/jfreeze/ex_ncurses.git"},
      {:exrm, "~> 1.0.0"}
    ]
  end
end
