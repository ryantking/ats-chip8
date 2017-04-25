(* ****** ****** *)
//
// staloadall.hats
// Includes and statically loads all required files
//
(* ****** ****** *)

#include "share/atspre_staload.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./SATS/chip8.sats"
staload SDL2e = "./SATS/SDL2_extra.sats"

(* end of [staloadall.hats] *)