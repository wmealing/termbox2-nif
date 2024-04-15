##
# hash-table
#
# @file
# @version 0.1

CC=gcc
ERL_INCLUDE = `erl -noshell -eval "io:format(\"~s/erts-~s/include/\", [code:root_dir(), erlang:system_info(version)])." -s erlang halt`
CFLAGS=-g -std=gnu11 -Wall -I$(ERL_INCLUDE)
LDLIBS=
#`pkg-config --cflags --libs glib-2.0`


# CC command:
CCC=$(CC) $(CFLAGS) $(LDLIBS)

# Edit these:
PROGNAME=termbox2

# Do not edit these:
SRC=src
OBJ=obj
SRCS=$(wildcard $(SRC)/**/*.c) $(wildcard $(SRC)/*.c)

# prepare and build binary
all: build

# create directory structure
prepare:
	-mkdir $(SRC)
	-mkdir $(OBJ)

# run `make bear` to generate a compile_commands.json file for CCLS
bear: clean
	bear -- make

build: prepare
	$(CCC) -o $(OBJ)/$(PROGNAME)_nif.so -fpic -shared $(SRCS)

# end
