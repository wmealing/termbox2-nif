-module(termbox2_test).
-export([start/0]).

% Import termbox2 module
-import(termbox2, [tb_init/0, tb_poll_event/0, tb_shutdown/0, tb_print/5, tb_present/0, tb_clear/0]).

% Main function to start the script
start() ->
    tb_init(),
    tb_print(0, 0, 0, 1, <<"Hello!">>),
    tb_present(),
    {Result, Type, Mod, Ch} = tb_poll_event(),
    tb_clear(),
    tb_print(
      0, 0, 0, 1,
      iolist_to_binary(io_lib:format("Result: ~p", [Result]))),
    tb_print(
      0, 1, 0, 1,
      iolist_to_binary(io_lib:format("Type: ~p", [Type]))),
    tb_print(
      0, 2, 0, 1,
      iolist_to_binary(io_lib:format("Mod: ~p", [Mod]))),
    tb_print(
      0, 3, 0, 1,
      iolist_to_binary(io_lib:format("Ch: ~p", [Ch]))),
    tb_present(),
    tb_poll_event(),
    tb_shutdown().
