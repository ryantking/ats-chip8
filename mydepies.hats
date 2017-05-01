(* ****** ****** *)
//
// mydepies.hats
// Loads external ATS dependencies.
//
(* ****** ****** *)

#define LIBSDL2_targetloc "$PATSHOMELOCS/atscntrb-libsdl2"
#define LIBPA_targetloc "$PATSHOMELOCS/atscntrb-rk-libportaudio"

(* ****** ****** *)

staload SDL2 = "{$LIBSDL2}/SATS/SDL.sats"
staload PA = "{$LIBPA}/portaudio.sats"

(* End of [mydepies.hats] *)