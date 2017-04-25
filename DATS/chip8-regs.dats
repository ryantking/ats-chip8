(* ****** ****** *)
//
// chip8-regs.dats
// Functions that read and write the values stored by byte and word registers.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

(* ****** ****** *)

local
  assume breg_type = ref(byte)
  assume wreg_type = ref(word)
in
  implement breg_get(r) = !r
  implement breg_set(r, b) = !r := b

  implement wreg_get(r) = !r
  implement wreg_set(r, w) = !r := w
  implement wreg_incr(r, w) = !r := !r + w
  implement wreg_decr(r, w) = !r := !r - w
end

(* ****** ****** *)

local
  extern castfn ref2breg(ref(byte)):<> breg
  extern castfn ref2wreg(ref(word)):<> wreg

  val rsz = i2sz(NUM_REGS)
  val bregs = arrayref_make_elt<breg?>(rsz, $extval(breg?, "0"))
  val bregs = $UN.cast{arrayref(breg, 16)}(bregs)
  val _ = arrayref_foreach(bregs, rsz) where {
    implement array_foreach$fwork<breg><void>(br, env) =
      br := ref2breg(ref<byte>(b_0x0))
  }
in
  implement V(w) =
    if w2i(w) >= NUM_REGS then $raise InvalidRegister(w2i(w))
    else bregs[$UN.cast{natLt(NUM_REGS)}(w)]

  implement PC = ref2wreg(ref<word>(w_0x0))
  implement I = ref2wreg(ref<word>(w_0x0))
end

(* End of chip8-regs.dats *)