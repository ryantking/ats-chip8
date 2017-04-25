(* ****** ****** *)
//
// chip8-scr.sats
// Function definitions for managing the display memory and showing the screen.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Getter and setter functions for the screen. The screen is a matrix of bytes,
// either 0 or 1 for black or white respectively. The screen is set via xorring.
fun screen_get_at(scr_x, scr_y): byte
fun screen_set_at(scr_x, scr_y, byte): void

// Shorthands
overload Scr with screen_get_at
overload Scr with screen_set_at

// Init, close, and update the actual display. The functions and display type
// are left open so they can have different implementations based on the way
// the emulator is displayed. For example, when using SDL, the display_type
// is more or less an alias to the SDL display type.
fun init_display(): display
fun close_display(display): void
fun update_display(!display): void

(* End of [chip8-regs.sats] *)