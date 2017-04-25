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
local #include "./chip8-font.dats" in end
local #include "./chip8-regs.dats" in end
local #include "./chip8-time.dats" in end
local #include "./chip8-stack.dats" in end
local #include "./chip8-scr.dats" in end
local #include "./chip8-inp.dats" in end
local #include "./chip8-loop.dats" in end

(* ****** ****** *)

local
  assume game_info_type = string
in
  fun load_game(info) =
    let
      fun loop(data: stream_vt(char), n: imem): void =
        case+ !data of
        | ~stream_vt_nil() => ()
        | ~stream_vt_cons(c, rest) => (
            Mem(n, c2b(c));
            if succ(n) < MEM_SIZE then loop(rest, succ(n))
            else (stream_vt_free(rest); $raise GameTooLarge())
          )

      val data = fileref_open_opt(info, file_mode_r)
    in
      case+ data of
        | ~None_vt() => $raise GameNotFound()
        | ~Some_vt(data) => loop(streamize_fileref_char(data), PC_START)
    end
end

(* ****** ****** *)

implement main0(argc, argv) = () where {
  val () = if argc != 2 then (
      if argc = 1 then fprintln!(stderr_ref, "chip8: no game specified")
      else fprintln!(stderr_ref, "chip8: Unknown arguments");
      exit(1)
  )
  val () = assertloc(argc = 2)
  val () = load_font()
  val () = load_game(argv[1])
  val () = PC.set(PC_START)
  val () = println!("Mem(0x0) = ", Mem(0x0))
  val () = println!("Mem(0x200) = ", Mem(0x200))
  val () = println!("Hell from chip8!")
}

(* End of [chip8-sdl.dats] *)