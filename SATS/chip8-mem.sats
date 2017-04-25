(* ****** ****** *)
//
// chip8-mem.sats
// Function definitions for reading and updating main memory.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Getter and setter functions for main memory
fun memory_get_at(imem): byte
fun memory_set_at(imem, byte): void

// Shorthand for accessing main memory
overload Mem with memory_get_at
overload Mem with memory_set_at

// Pointer to the Chip8 font
macdef chip8_font = $extval(arrayref(byte, FONT_SZ), "chip8_font")

// Loads the font into memory
fun load_font(): void

// Loads the game from an external memory location
fun load_game(game_info): void

(* End of [chip8-mem.sats] *)