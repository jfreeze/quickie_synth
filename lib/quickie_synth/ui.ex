defmodule QuickieSynth.UI do
  use GenServer

  alias QuickieSynth.Sound
  alias QuickieSynth.KeyboardMap
  alias ExNcurses, as: N

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def init(_) do
    N.n_begin()
    N.keypad()      # Enable support of Function Keys
    N.flushinp()    # clear input
    clear_key_note()

    :timer.send_interval(50, :poll)
    {:ok, 0}
  end

  def handle_info(:poll, state) do
    N.noecho()
    N.flushinp()
    ch = N.getchar()
    process_char(ch)
    if ch != N.fun(:F1) do
      {:noreply, state}
    else
      {:stop, :normal}
    end
  end

  def terminate(:normal, _state) do
    N.endwin()

    # If done, quit Elixir too
    System.halt
  end
  def terminate(_reason, _state) do
    # If terminating unexpectedly, reset ncurses and
    # let the supervisor restart us
    N.endwin()
  end

  defp clear_key_note() do
    N.mvprintw(11, 10, "F1 to exit")
    N.mvprintw(10, 10, "note:   ")
    N.mvprintw( 9, 10, "key:    ")
    N.mvprintw( 9, 10, "key: ")
  end

  defp process_char(ch) do
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
