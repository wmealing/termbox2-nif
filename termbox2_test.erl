-module(termbox2_test).
-export([start/0]).
-import(termbox2, [
    tb_init/0,
    tb_shutdown/0,
    tb_clear/0,
    tb_present/0,
    tb_poll_event/0,
    tb_print/5
]).

tb_loop() ->
    tb_print(0, 0, 0, 1, <<"Press any key (q to exit):">>),
    tb_present(),
    {_Result, _Type, _Mod, Char} = tb_poll_event(),
    tb_clear(),
    tb_print(0, 1, 0, 1, iolist_to_binary(io_lib:format("Character: ~p", [Char]))),
    tb_present(),
    if
        Char == 113 -> nil;
        true -> tb_loop()
    end.

start() ->
    tb_init(),
    tb_loop(),
    tb_shutdown().
