(* ****** ****** *)
//
// chip8-time.sats
// Function definitions for managing timers and controling system time.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// The delay timer and sound timer
val DT: timer
val ST: timer

// Getter, setter, and tick function for timer. Timers are are a special type
// of byte register. Tick is different than decrease because it checks if the
// timer is zero before decrementing it.
fun timer_get(timer): byte
fun timer_set(timer, byte): void
fun timer_tick(timer, byte): void

// Shorthands
overload .get with timer_get
overload .set with timer_set
overload .tick with timer_tick

(* End of [chip8-time.sats] *)