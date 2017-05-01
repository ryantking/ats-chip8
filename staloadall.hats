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
staload UN = "prelude/SATS/unsafe.sats"
staload "libats/libc/SATS/math.sats"
staload SDL2e = "./SATS/SDL2_extra.sats"
staload "libats/SATS/athread.sats"
staload "libats/libc/SATS/unistd.sats"
staload _ = "libats/DATS/athread.dats"
staload _ = "libats/DATS/athread_posix.dats"

(* end of [staloadall.hats] *)