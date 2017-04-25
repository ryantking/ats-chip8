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

exception SDLException of (string)

(* ****** ****** *)

local
  assume display_type = $SDL2.SDL_Window_ptr1
in
  implement init_display() = dpy where {
    val () = if $SDL2.SDL_Init($SDL2.SDL_INIT_EVERYTHING) > 0
      then $raise SDLException($SDL2.SDL_GetError())
    val dpy = $SDL2.SDL_CreateWindow(
          "Chip8",
          $SDL2.SDL_WINDOWPOS_UNDEFINED, $SDL2.SDL_WINDOWPOS_UNDEFINED,
          SCR_WIDTH * SCALE, SCR_HEIGHT * SCALE,
          $SDL2.SDL_WINDOW_SHOWN
        )
    val () = if $SDL2.ptrcast(dpy) = 0
      then $raise SDLException($SDL2.SDL_GetError())
    val () = assertloc($SDL2.ptrcast(dpy) > 0)
    val () = update_display(dpy)
  }

  implement close_display(dpy) = (
    $SDL2.SDL_DestroyWindow(dpy);
    $SDL2.SDL_Quit()
  )

  implement update_display(dpy) = () where {
    fun draw_x(surf: !$SDL2.SDL_Surface_ptr1, x: scr_x, y: scr_y): void =
      let
        var pix : $SDL2.SDL_Rect
        val () = pix.x := x * SCALE and () = pix.y := y * SCALE
        val () = pix.w := SCALE and () = pix.h := SCALE
        val color = if Scr(x, y) = b_0x1 then i2u(0xFFFFFF) else i2u(0x000000)
        val () = if $SDL2e.SDL_FillRect(surf, cptr_rvar(pix), color) > 0
          then $raise SDLException($SDL2.SDL_GetError())
      in
        if succ(x) < SCR_WIDTH then draw_x(surf, succ(x), y)
      end

    fun draw_y(surf: !$SDL2.SDL_Surface_ptr1, y: scr_y): void = (
      draw_x(surf, 0, y);
      if succ(y) < SCR_HEIGHT then draw_y(surf, succ(y))
    )

    val (fpf | surf) = $SDL2.SDL_GetWindowSurface(dpy)
    val () = if $SDL2.ptrcast(surf) = 0 then
      $raise SDLException($SDL2.SDL_GetError())
    val () = assertloc($SDL2.ptrcast(surf) > 0)
    val () = draw_y(surf, 0)
    prval () = fpf(surf)
    val () =  if $SDL2.SDL_UpdateWindowSurface(dpy) > 0 then
      $raise SDLException($SDL2.SDL_GetError())
  }
end

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
  val () = PC.set(i2w(PC_START))
  val () = init_clock()
  val dpy = init_display()
  val () = $SDL2.SDL_Delay(1000)
  val () = close_display(dpy)
  val () = println!("Mem(0x0) = ", Mem(0x0))
  val () = println!("Mem(0x200) = ", Mem(0x200))
  val () = println!("Hell from chip8!")
}

(* End of [chip8-sdl.dats] *)