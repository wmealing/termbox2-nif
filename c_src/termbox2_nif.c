#define TB_IMPL
#include <termbox2.h>
#include <erl_nif.h>

static ERL_NIF_TERM nif_tb_init(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  return enif_make_int(env, tb_init());
}

static ERL_NIF_TERM nif_tb_shutdown(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  return enif_make_int(env, tb_shutdown());
}

static ERL_NIF_TERM nif_tb_width(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  return enif_make_int(env, tb_width());
}

static ERL_NIF_TERM nif_tb_height(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  return enif_make_int(env, tb_height());
}

static ERL_NIF_TERM nif_tb_clear(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  return enif_make_int(env, tb_clear());
}

static ERL_NIF_TERM nif_tb_present(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  return enif_make_int(env, tb_present());
}

static ERL_NIF_TERM nif_tb_set_cursor(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  int cx, cy;
  if (!enif_get_int(env, argv[0], &cx)) return enif_make_badarg(env);
  if (!enif_get_int(env, argv[1], &cy)) return enif_make_badarg(env);
  return enif_make_int(env, tb_set_cursor(cx, cy));
}

static ERL_NIF_TERM nif_tb_hide_cursor(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  return enif_make_int(env, tb_hide_cursor());
}

static ERL_NIF_TERM nif_tb_set_cell(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  int x, y;
  uint32_t ch;
  uintattr_t fg, bg;
  if (!enif_get_int(env, argv[0], &x)) return enif_make_badarg(env);
  if (!enif_get_int(env, argv[1], &y)) return enif_make_badarg(env);
  if (!enif_get_uint(env, argv[2], &ch)) return enif_make_badarg(env);
  if (!enif_get_uint64(env, argv[3], &fg)) return enif_make_badarg(env);
  if (!enif_get_uint64(env, argv[4], &bg)) return enif_make_badarg(env);
  return enif_make_int(env, tb_set_cell(x, y, ch, fg, bg));
}

static ERL_NIF_TERM nif_tb_peek_event(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  struct tb_event ev;
  int timeout_ms;
  if (!enif_get_int(env, argv[0], &timeout_ms)) return enif_make_badarg(env);
  int res = tb_peek_event(&ev, timeout_ms);
  return enif_make_tuple4
    (env,
     enif_make_int(env, res),
     enif_make_int(env, ev.type),
     enif_make_int(env, ev.mod),
     enif_make_int(env, ev.ch));
}

static ERL_NIF_TERM nif_tb_poll_event(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  struct tb_event ev;
  int res = tb_poll_event(&ev);
  return enif_make_tuple4
    (env,
     enif_make_int(env, res),
     enif_make_int(env, ev.type),
     enif_make_int(env, ev.mod),
     enif_make_int(env, ev.ch));
}

static ERL_NIF_TERM nif_tb_print(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  int x, y;
  uintattr_t fg, bg;
  ErlNifBinary binary;
  if (!enif_get_int(env, argv[0], &x)) return enif_make_badarg(env);
  if (!enif_get_int(env, argv[1], &y)) return enif_make_badarg(env);
  if (!enif_get_uint64(env, argv[2], &fg)) return enif_make_badarg(env);
  if (!enif_get_uint64(env, argv[3], &bg)) return enif_make_badarg(env);
  if (!enif_inspect_binary(env, argv[4], &binary)) return enif_make_atom(env, "err");

  char* string = enif_alloc(binary.size + 1);
  if (string == NULL) return enif_make_badarg(env);

  memcpy(string, binary.data, binary.size);
  string[binary.size] = '\0';
  int res = enif_make_int(env, tb_print(x, y, fg, bg, string));

  enif_free(string);
  return res;
}

static ErlNifFunc nif_funcs[] = {
    {"tb_init", 0, nif_tb_init},
    {"tb_shutdown", 0, nif_tb_shutdown},
    {"tb_width", 0, nif_tb_width},
    {"tb_height", 0, nif_tb_height},
    {"tb_clear", 0, nif_tb_clear},
    {"tb_present", 0, nif_tb_present},
    {"tb_set_cursor", 2, nif_tb_set_cursor},
    {"tb_hide_cursor", 0, nif_tb_hide_cursor},
    {"tb_set_cell", 5, nif_tb_set_cell},
    {"tb_peek_event", 1, nif_tb_peek_event},
    {"tb_poll_event", 0, nif_tb_poll_event},
    {"tb_print", 5, nif_tb_print}
};

ERL_NIF_INIT(termbox2, nif_funcs, NULL, NULL, NULL, NULL)
