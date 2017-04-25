(* ****** ****** *)
//
// chip8-mem.sats
// Function definitions for controlling the cpu registers.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Return a specific byte register for use
fun V(I: nreg): breg

// Byte register getter and setter functions
fun breg_get(r: breg): byte
fun breg_set(r: breg, b: byte): void

// Shorthands
overload .get with breg_get
overload .set with breg_set

(* ****** ****** *)

// 16-bit program counter and index registers
val PC: wreg
val I: wreg

// Getter, setter, increase, and decreate function since the word registers are
// set relatively to themselves usually. Since both the program counter and
// index registers are used for storing memory locations, there will be a getter
// for both words and memory indexes, which are ints bounded to the memory size.
// The values will not be checked to make sure they're a valid memory index
// until the getter is called and the cast does that.
fun wreg_get_word(r: wreg): word
fun wreg_get_imem(r: wreg): imem
fun wreg_set(r: wreg, w: word): void
fun wreg_incr(r: wreg, w: word): void
fun wreg_decr(r: wreg, w: word): void

// Shorthands
overload .get with wreg_get_word
overload .get with wreg_get_imem
overload .set with wreg_set
overload .incr with wreg_

(* End of [chip8-regs.sats] *)