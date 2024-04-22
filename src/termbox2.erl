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

tb_init() ->
    erlang:nif_error(nif_library_not_loaded).
tb_shutdown() ->
    erlang:nif_error(nif_library_not_loaded).
tb_width() ->
    erlang:nif_error(nif_library_not_loaded).
tb_height() ->
    erlang:nif_error(nif_library_not_loaded).
tb_clear() ->
    erlang:nif_error(nif_library_not_loaded).
tb_present() ->
    erlang:nif_error(nif_library_not_loaded).
tb_set_cursor(_X, _Y) ->
    erlang:nif_error(nif_library_not_loaded).
tb_hide_cursor() ->
    erlang:nif_error(nif_library_not_loaded).
tb_set_cell(_X, _Y, _Ch, _Fg, _Bg) ->
    erlang:nif_error(nif_library_not_loaded).
tb_peek_event(_Timeout) ->
    erlang:nif_error(nif_library_not_loaded).
tb_poll_event() ->
    erlang:nif_error(nif_library_not_loaded).
tb_print(_X, _Y, _Fg, _Bg, _Str) ->
    erlang:nif_error(nif_library_not_loaded).
