(* ****** ****** *)
//
// chip8-base.dats
// Implementation of basic functions to work with bytes and words.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

(* ****** ****** *)

implement print_byte(b) = fprint(stdout_ref, b)
implement print_word(w) = fprint(stdout_ref, w)

(* ****** ****** *)

implement fprint_byte(out, b) = $extfcall(void, "fprintf", out, "B(%02x)", b)
implement fprint_word(out, w) = $extfcall(void, "fprintf", out, "W(%04x)", w)

(* End of [chip8-base.dats] *)