(* ****** ****** *)
//
// chip8-inp.sats
// Function definitions for keeping track of key states.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Clears all the keys' statuses
fun clear_keys(): void

// Checks whether a key is pressed
fun check_key(nkey): bool

// Presses and releases keys
fun press_key(nkey): void
fun release_key(nkey): void

// Polls for key events
fun poll_kb(): void

// Waits for a key to be pressed
fun wait_for_key(word): void

// Returns whether or not the program is awaiting a key press
fun waiting_for_key(): bool

(* End of [chip8-inp.sats] *)