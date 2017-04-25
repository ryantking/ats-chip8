(* ****** ****** *)
//
// chip8-stack.sats
// Function definitions for pushing to and popping from the stack
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Push and pop to the stack. Values are pushed and stored as words in order to
// remain faithful to the original chip8 implementation, but are returned as
// memory indexes since only valid memory locations can be pushed.
fun stack_pop(): imem
fun stack_push(word): void

(* End of [chip8-stack.sats] *)