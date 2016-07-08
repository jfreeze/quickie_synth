defmodule QuickieSynth do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(QuickieSynth.UI, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: QuickieSynth.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
