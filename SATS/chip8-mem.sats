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

// Loads the font into memory
fun load_font(): void

// Reads the game from an external location and returns the data.
fun read_game(rom_info): rom

// Loads the game data into memory.
fun load_game(rom): void

(* End of [chip8-mem.sats] *)