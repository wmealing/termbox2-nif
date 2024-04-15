##
# termbox2 NIF
#
# @file
# @version 0.1

CC=gcc
ERL_INCLUDE = `erl -noshell -eval "io:format(\"~s/erts-~s/include/\", [code:root_dir(), erlang:system_info(version)])." -s erlang halt`
CFLAGS=-g -std=gnu11 -Wall -I$(ERL_INCLUDE)
CCC=$(CC) $(CFLAGS)
PROGNAME=termbox2

build:
	$(CCC) -o $(PROGNAME)_nif.so -fpic -shared termbox2_nif.c

bear:
	bear -- $(CCC) -o $(PROGNAME)_nif.so -fpic -shared termbox2_nif.c

demo: build
	erlc termbox2_test.erl termbox2.erl
	erl -pa . -noshell -s termbox2_test start -s init stop


# end
