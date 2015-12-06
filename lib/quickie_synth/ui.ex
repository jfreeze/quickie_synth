defmodule QuickieSynth.UI do
  alias QuickieSynth.Sound
  alias QuickieSynth.KeyboardMap
  import ExNcurses

  def main(_args) do
    start
  end

  def start do
    initui()
    loop()
    ex_endwin()
  end

  def initui do
    ncurses_begin()
    ex_keypad()      # Enable support of Function Keys
    ex_flushinp()    # clear input
    clear_key_note()
  end

  def clear_key_note() do
    ex_mvprintw(11, 10, "F1 to exit")
    ex_mvprintw(10, 10, "note:   ")
    ex_mvprintw( 9, 10, "key:    ")
    ex_mvprintw( 9, 10, "key: ")
  end

  def loop() do
    ex_noecho()
    ex_flushinp()
    ch = getchar()
    process_char ch
   if ch != fun(:F1), do: loop()
  end

  def process_char(ch) do
    key = List.to_string([ch])
    note = KeyboardMap.note_for(key)
    case note do
      :nomap ->
        clear_key_note()
        :ok
      _ ->
        ex_mvprintw(9, 10, "key:       ")
        ex_mvprintw(9, 10, "key:  #{key}")
        ex_mvprintw(10, 10, "note:        ")
        ex_mvprintw(10, 10, "note: #{note}")
        ex_refresh()
        spawn(Sound, :play, [note])
    end
  end

end
