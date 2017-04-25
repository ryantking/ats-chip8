(* ****** ****** *)
//
// chip8-sdl.dats
// Main file to run chip8 with an SDL frontend.
//
(* ****** ****** *)

#include "./../mydepies.hats"
#include "./../staloadall.hats"

#define CHIP8_MAIN 1

local #include "./chip8-base.dats" in end
local #include "./chip8-mem.dats" in end
local #include "./chip8-regs.dats" in end
local #include "./chip8-time.dats" in end
local #include "./chip8-stack.dats" in end
local #include "./chip8-scr.dats" in end
local #include "./chip8-inp.dats" in end
local #include "./chip8-loop.dats" in end

(* ****** ****** *)

implement main0(argc, argv) = () where {
  val () = println!("Hell from chip8!")
  val () = println!("b_0x0 = ", b_0x0)
  val () = println!("b_0x1 = ", b_0x1)
  val () = println!("w_0x0 = ", w_0x0)
  val () = println!("w_0x1 = ", w_0x1)
}

(* End of [chip8-sdl.dats] *)