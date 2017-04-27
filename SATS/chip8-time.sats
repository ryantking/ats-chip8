(* ****** ****** *)
//
// chip8-time.sats
// Function definitions for managing timers and controling system time.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// The current time in seconds (with milliseconds)
fun get_time(): time_t

// Functions to init the clock, decrease the timers, and manage speed
fun init_clock(): void
fun sync_clock(): int

// Returns whether or not there's time for another instruction
fun has_time(): bool

// The delay timer and sound timer
val DT: timer
val ST: timer

// Getter, setter, and tick function for timer. Timers are are a special type
// of byte register. Tick is different than decrease because it checks if the
// timer is zero before decrementing it.
fun timer_get(timer): byte
fun timer_set(timer, byte): void
fun timer_decr(timer, byte): void


// Shorthands
overload .get with timer_get
overload .set with timer_set
overload .decr with timer_decr

(* End of [chip8-time.sats] *)