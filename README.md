# ExNcurses Demo using QuickieSynth from Elixir Sips.

  [http://elixirsips.com/episodes/062_quickie_synth.html]

# Install and run

QuickieSynth requires `sox` to play the notes. Install it using the package
manager on your system. For example,

    sudo apt-get install sox

or

    brew install sox

Then, clone this repository and build the project:

    mix deps.get
    mix build

To start the ncurses UI for QuickieSynth, run:

    mix start

This invokes `QuickieSynth.UI.start`. Type any key on the bottom two rows
of the keyboard to play notes. Since ncurses takes control over the
terminal, calling this from `iex -S mix` doesn't work well.
