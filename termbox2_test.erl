-module(termbox2_test).
-export([start/0]).

% Import termbox2 module
-import(termbox2, [tb_init/0, tb_poll_event/0, tb_shutdown/0]).

% Main function to start the script
start() ->
    tb_init(),
    {Result, Type, Mod, Ch} = tb_poll_event(),
    io:format("Result: ~p~nType: ~p~nMod: ~p~nCh: ~p~n", [Result, Type, Mod, Ch]),
    timer:sleep(2000),
    tb_shutdown().
