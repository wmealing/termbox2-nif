%% @author Wade Mealing <wmealing@gmail.com>
%% @version 0.1.1

-module('termbox2').


-export([
    tb_init/0,
    tb_shutdown/0,
    tb_width/0,
    tb_height/0,
    tb_clear/0,
    tb_present/0,
    tb_set_cursor/2,
    tb_hide_cursor/0,
    tb_set_cell/5,
    tb_peek_event/1,
    tb_poll_event/0,
    tb_print/5
]).
-nifs([
    tb_init/0,
    tb_shutdown/0,
    tb_width/0,
    tb_height/0,
    tb_clear/0,
    tb_present/0,
    tb_set_cursor/2,
    tb_hide_cursor/0,
    tb_set_cell/5,
    tb_peek_event/1,
    tb_poll_event/0,
    tb_print/5
]).
-on_load(init/0).

init() ->
    ok = erlang:load_nif("./priv/termbox2_nif", 0).


%% @doc Initializes the termbox library. This function should be called before any other functions.
tb_init() ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc The library must be finalized using the tb_shutdown() function.  Called only when no more tb_ functions are required.
%% @returns Nothing.
%% @end
tb_shutdown() ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Returns the size of the internal back buffer (which is the same as terminal's window size in columns
tb_width() ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Returns the size of the internal back buffer (which is the same as terminal's window size in rows
tb_height() ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Clears the internal back buffer using TB_DEFAULT color.
tb_clear() ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Synchronizes the internal back buffer with the terminal by writing to the tty.
tb_present() ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Sets the position of the cursor. Upper-left character is (0, 0).
tb_set_cursor(_X, _Y) ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Hides the cursor, not every tty supports this.
tb_hide_cursor() ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Sets the individual position of the screen at x,y to character ch, with foreground color fg and bg color bg.
tb_set_cell(_X, _Y, _Ch, _Fg, _Bg) ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Wait for an event up to timeout_ms milliseconds, returning event details in a tuple.
%% @returns "A THING"
tb_peek_event(_Timeout) ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Same as tb_peek_event except no timeout, probably going to beat up erlang scheduler, maybe ?
tb_poll_event() ->
    erlang:nif_error(nif_library_not_loaded).

%% @doc Print the string at the X and y locations with fg and background colors set.
tb_print(_X, _Y, _Fg, _Bg, _Str) ->
    erlang:nif_error(nif_library_not_loaded).
