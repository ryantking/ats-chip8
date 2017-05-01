(* ****** ****** *)
//
// chip8-snd.sats
// Function definitions for outputing beeps
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

fun sound_thread(): void

castfn padata2ptr (data: PaData):<> Ptr0
overload ptrcast with padata2ptr

(* End of [chip8-snd.sats] *)