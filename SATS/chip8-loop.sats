(* ****** ****** *)
//
// chip8-loop.sats
// Function definitions for the main emulation loop.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Ends the main loop
fun quit(): void

// One cycle of emulation
fun game_loop(!display): void

// Functions to get (and set in the case of the registers) the individual parts
// of the opcode.
fun opcode_get_first(opcode): byte
fun opcode_get_Vx(opcode): breg
fun opcode_set_Vx(opcode, byte): void
fun opcode_get_Vy(opcode): breg
fun opcode_set_Vy(opcode, byte): void
fun opcode_get_last3(opcode): word
fun opcode_get_last2(opcode): byte
fun opcode_get_last1(opcode): byte

// Shorthands
overload first with opcode_get_first
overload Vx with opcode_get_Vx
overload Vx with opcode_set_Vx
overload Vy with opcode_get_Vy
overload Vy with opcode_set_Vy
overload last3 with opcode_get_last3
overload last2 with opcode_get_last2
overload last1 with opcode_get_last1

// Gets the next opcode from memory
fun fetch(): word

// Decodes the information encoded in the opcode.
fun decode(): opcode

// Executes the opcode
fun execute(opcode): void

(* End of [chip8-loop.sats] *)