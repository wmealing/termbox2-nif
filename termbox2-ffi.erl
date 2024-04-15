-module(complex6).
-export([tb_init/0, tb_shutdown/0]).
-nifs([tb_init/0, tb_shutdown/0]).
-on_load(init/0).

init() ->
    ok = erlang:load_nif("./tbox_nif", 0).

tb_init() ->
    erlang:nif_error(nif_library_not_loaded).
tb_shutdown() ->
    erlang:nif_error(nif_library_not_loaded).
