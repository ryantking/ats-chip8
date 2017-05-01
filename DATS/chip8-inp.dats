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
  implement waiting_for_key = ref<bool>(false)
  implement waiting_key_reg = ref<breg>(V(w_0x0))

  implement clear_keys() = loop(0) where {
    fun loop(i: nkey): void = (
      keys[i] := false;
      if succ(i) < NUM_KEYS then loop(succ(i))
    )
  }

  implement check_key(i) = keys[i]

  implement press_key(i) = (
    keys[i] := true;
    if !waiting_for_key then (!waiting_key_reg).set(i2b(i));
    !waiting_for_key := false
  )

  implement release_key(i) = keys[i] := false
end

(* End of chip8-inp.dats *)