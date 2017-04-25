(* ****** ****** *)
//
// chip8.sats
// Main SATS file to load all the others
//
(* ****** ****** *)

%{#
#include "../CATS/chip8.cats"
%}
#define ATS_EXTERN_PREFIX "chip8_"

(* ****** ****** *)

#include "./chip8-base.sats"

(* End of [chip8.sats] *)