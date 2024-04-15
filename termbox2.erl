-module('termbox2').
-export([
    tb_init/0,
    tb_shutdown/0,
    tb_poll_event/0,
    tb_width/0,
    tb_height/0,
    tb_clear/0,
    tb_present/0
]).
-nifs([
    tb_init/0,
    tb_shutdown/0,
    tb_poll_event/0,
    tb_width/0,
    tb_height/0,
    tb_clear/0,
    tb_present/0
]).
-on_load(init/0).

init() ->
    ok = erlang:load_nif("./obj/termbox2_nif", 0).

tb_init() ->
    erlang:nif_error(nif_library_not_loaded).
tb_shutdown() ->
    erlang:nif_error(nif_library_not_loaded).
tb_poll_event() ->
    erlang:nif_error(nif_library_not_loaded).
tb_width() ->
    erlang:nif_error(nif_library_not_loaded).
tb_height() ->
    erlang:nif_error(nif_library_not_loaded).
tb_clear() ->
    erlang:nif_error(nif_library_not_loaded).
tb_present() ->
    erlang:nif_error(nif_library_not_loaded).
