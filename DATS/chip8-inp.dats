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
  val waiting_key = ref<word>(w_0x0)
in
  implement clear_keys() = loop(0) where {
    fun loop(i: nkey): void = (
      keys[i] := false;
      if succ(i) < NUM_KEYS then loop(succ(i))
    )
  }

  implement check_key(i) = keys[i]

  implement press_key(i) = (
    keys[i] := true;
    if waiting_for_key() then (V(x)).set(i2b(i)) where {
      val x = !waiting_key land i2w(0x80)
      val () = !waiting_key := w_0x0
    })

  implement release_key(i) = keys[i] := false

  implement wait_for_key(x) = !waiting_key := x

  implement waiting_for_key() = !waiting_key > w_0x0
end

(* End of chip8-inp.dats *)