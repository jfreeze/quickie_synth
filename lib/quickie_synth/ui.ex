defmodule QuickieSynth.UI do
  alias QuickieSynth.Sound
  alias QuickieSynth.KeyboardMap
  alias ExNcurses, as: N

  def main(_args) do
    start
  end

  def start do
    initui()
    loop()
    N.endwin()
  end

  def initui do
    N.n_begin()
    N.keypad()      # Enable support of Function Keys
    N.flushinp()    # clear input
    clear_key_note()
  end

  def clear_key_note() do
    N.mvprintw(11, 10, "F1 to exit")
    N.mvprintw(10, 10, "note:   ")
    N.mvprintw( 9, 10, "key:    ")
    N.mvprintw( 9, 10, "key: ")
  end

  def loop() do
    N.noecho()
    N.flushinp()
    ch = N.getchar()
    process_char ch
   if ch != N.fun(:F1), do: loop()
  end

  def process_char(ch) do
    key = List.to_string([ch])
    note = KeyboardMap.note_for(key)
    case note do
      :nomap ->
        clear_key_note()
        :ok
      _ ->
        N.mvprintw(9, 10, "key:       ")
        N.mvprintw(9, 10, "key:  #{key}")
        N.mvprintw(10, 10, "note:        ")
        N.mvprintw(10, 10, "note: #{note}")
        N.refresh()
        spawn(Sound, :play, [note])
    end
  end

end
