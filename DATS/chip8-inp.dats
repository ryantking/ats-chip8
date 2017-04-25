(* ****** ****** *)
//
// chip8-inp.dats
// Implementations of functions that check and update key states.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

(* ****** ****** *)

local
  val kb_sz = i2sz(NUM_KEYS)
  val keys = arrayref_make_elt<bool>(kb_sz, false)
in
  implement clear_keys() = loop(0) where {
    fun loop(i: nkey): void = (
      keys[i] := false;
      if succ(i) < NUM_KEYS then loop(succ(i))
    )
  }

  implement check_key(i) = keys[i]
  implement press_key(i) = keys[i] := true
  implement release_key(i) = keys[i] := false
end

(* End of chip8-inp.dats *)