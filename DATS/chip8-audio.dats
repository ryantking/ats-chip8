(* ****** ****** *)
//
// chip8-audio.dats
// Implementations of functions to output sound
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

(* ****** ****** *)

local
  assume audio_mixer_type = '{
    spec= $SDL2e.SDL_AudioSpec,
    obtained=$SDL2e.SDL_AudioSpec
  }
in
end

(* End of chip8-audio.dats *)