(* ****** ****** *)
//
// chip8-inp.sats
// Function definitions for keeping track of key states.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Whether or not the system is waiting for a key press
val waiting_for_key: ref(bool)
val waiting_key_reg: ref(breg)

// Clears all the keys' statuses
fun clear_keys(): void

// Checks whether a key is pressed
fun check_key(nkey): bool

// Presses and releases keys
fun press_key(nkey): void
fun release_key(nkey): void

// Polls for key events
fun poll_kb(): void

(* End of [chip8-inp.sats] *)