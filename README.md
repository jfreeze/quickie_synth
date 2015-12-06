# ExNcurses Demo using QuickieSynth from Elixir Sips.

  [http://elixirsips.com/episodes/062_quickie_synth.html]

# Installation

Add the ex_ncurses project to your project dependencies in mix.exs:

    {:ex_ncurses, git: "https://github.com/jfreeze/ex_ncurses.git"}

Then, update your project dependencies, compile, build and run the proejct:

    mix deps.get
    mix deps.compile
    mix build
    ./priv/start

The current Makefile is only tested on OS X. You may need to customize it to build the ExNcurses Nif for your system.

As long as the nif is found in ex_ncurses/priv, your project should be able to load the nif.


Note, you cannot run ex_ncurses using 'iex -S mox'. It must be run as its own application.

# QuickieSynth

An Elixir based synthesizer. To use it, you can run:

    QuickieSynth.Sound.play("C")

If you want ot build a composition, you can do that like so:

    QuickieSynth.Composition.play(100, "ABCCCDDEE")


To run the keyboard UI, evaluate the following:

    QuickieSynth.UI.start

Type any key on the bottom two rows of the keyboard to play notes.
