(* ****** ****** *)
//
// chip8-loop.dats
// Implementation of functions that handle the main emulation loop.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

(* ****** ****** *)

local
  val interrupted = ref<bool>(false)
in
  implement quit() = !interrupted := true
end

(* End of chip8-loop.dats *)