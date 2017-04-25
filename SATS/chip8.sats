(* ****** ****** *)
//
// chip8.sats
// Main SATS file to load all the others plus some miscellanious stuff.
//
(* ****** ****** *)

%{#
#include "../CATS/chip8.cats"
%}
#define ATS_EXTERN_PREFIX "chip8_"

(* ****** ****** *)

#include "./chip8-base.sats"
#include "./chip8-mem.sats"
#include "./chip8-regs.sats"
#include "./chip8-time.sats"
#include "./chip8-stack.sats"
#include "./chip8-scr.sats"
#include "./chip8-inp.sats"
#include "./chip8-loop.sats"

// Loads the game from an external memory location
fun load_game(game_info): void

(* ****** ****** *)

// Font

(* ****** ****** *)

// Bytes used to store the chip8 font
#define FONT_SZ 80

// Pointer to the Chip8 font
macdef chip8_font = $extval(arrayref(byte, FONT_SZ), "chip8_font")

// Loads the font into memory
fun load_font(): void

(* End of [chip8.sats] *)