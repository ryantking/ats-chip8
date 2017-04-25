(* ****** ****** *)
//
// chip8-scr.dats
// Implementations of functions to manage the virtual screen.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

(* ****** ****** *)

local
  val scrw_sz = i2sz(SCR_WIDTH)
  val scrh_sz = i2sz(SCR_HEIGHT)
  val screen = matrixref_make_elt<byte>(scrw_sz, scrh_sz, b_0x0)
in
  implement screen_get_at(px, py) = screen[px, SCR_HEIGHT, py]

  implement screen_set_at(px, py, v) = screen[px, SCR_HEIGHT, py] := v

  implement clear_screen() = matrixref_foreach(screen, scrw_sz, scrh_sz) where {
    implement matrix_foreach$fwork<byte><void>(px, env) = px := b_0x0
  }
end

(* End of chip8-scr.dats *)