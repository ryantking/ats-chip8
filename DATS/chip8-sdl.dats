(* ****** ****** *)
//
// chip8-sdl.dats
// Main file to run chip8 with an SDL frontend.
//
(* ****** ****** *)

%{^
typedef struct audio_queue_struct {
  unsigned int seconds;
  int first;
  struct audio_queue_struct *next;
} audio_queue;

audio_queue *aq_head = NULL;
audio_queue *aq_tail = NULL;

void audio_callback(void* userdata, unsigned char *stream, int len) {
  short* target = (short *) stream;

  while (len > 0 && aq_head != NULL) {
    audio_queue *data = aq_head;
    for (; len && data->first; target += 2, len -= 4, data->first -= 1)
      target[0] = target[1] = data->seconds * 300 * ((len & 128) - 64);
    if (!data->first) {
      aq_head = aq_head->next;
      if (aq_head == NULL) aq_tail = NULL;
    }
  }
}

SDL_AudioSpec *init_desired() {
  SDL_AudioSpec *desired = (SDL_AudioSpec *) malloc(sizeof(SDL_AudioSpec));
  desired->freq = 44100;
  desired->format = AUDIO_S16SYS;
  desired->channels = 2;
  desired->samples = desired->freq / 20;
  desired->callback = audio_callback;

  return desired;
}

SDL_AudioSpec *init_obtained() {
  SDL_AudioSpec *obtained = (SDL_AudioSpec *) malloc(sizeof(SDL_AudioSpec));

  return obtained;
}

void free_spec(SDL_AudioSpec *spec) { free(spec); }

int get_freq(SDL_AudioSpec *spec) { return spec->freq; }

void aq_enqueue(unsigned int seconds, int first) {
  if (aq_head == NULL) {
    aq_head = malloc(sizeof(audio_queue));
    aq_head->seconds = seconds;
    aq_head->first = first;
    aq_head->next = NULL;
    aq_tail = aq_head;
  } else {
    aq_tail->next = malloc(sizeof(audio_queue));
    aq_tail->next->seconds = seconds;
    aq_tail->next->first = first;
    aq_tail->next->next = NULL;
    aq_tail = aq_tail->next;
  }
}
%}

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

implement poll_kb() =
  let
    overload = with $SDL2.SDL_EventType_equal
    var event : $SDL2.SDL_Event?
    val res = $SDL2.SDL_PollEvent(event)
    prval () = if res > 0 then opt_unsome(event) else opt_unnone(event)
    val event = $UN.cast{$SDL2.SDL_Event}(event)
    val evtp = event.type
  in
    if evtp = $SDL2.SDL_QUIT then quit()
    else if evtp = $SDL2.SDL_KEYUP || evtp = $SDL2.SDL_KEYDOWN then
      let
        val key_sym = $SDL2e.GetKeysym(event)
        val key = (
          ifcase
            | key_sym = $SDL2e.SDLK_ESCAPE => 0x10
            | key_sym = $SDL2e.SDLK_1 => 0x1
            | key_sym = $SDL2e.SDLK_2 => 0x2
            | key_sym = $SDL2e.SDLK_3 => 0x3
            | key_sym = $SDL2e.SDLK_4 => 0xF
            | key_sym = $SDL2e.SDLK_q => 0x4
            | key_sym = $SDL2e.SDLK_w => 0x5
            | key_sym = $SDL2e.SDLK_e => 0x6
            | key_sym = $SDL2e.SDLK_r => 0xE
            | key_sym = $SDL2e.SDLK_a => 0x7
            | key_sym = $SDL2e.SDLK_s => 0x8
            | key_sym = $SDL2e.SDLK_d => 0x9
            | key_sym = $SDL2e.SDLK_f => 0xD
            | key_sym = $SDL2e.SDLK_z => 0xA
            | key_sym = $SDL2e.SDLK_x => 0x0
            | key_sym = $SDL2e.SDLK_c => 0xB
            | key_sym = $SDL2e.SDLK_v => 0xC
            | _                => ~1
          ) : int
      in
        if key = ~1 then ()
        else if key = 0x10 then quit()
        else
          let
              val key = $UN.cast{nkey}(key)
          in
            if evtp = $SDL2.SDL_KEYUP then release_key(key)
            else press_key(key)
          end
    end
end

(* ****** ****** *)

local
  absvtype mixer_ptr(l:addr) = ptr(l)
  vtypedef mixer_ptr0 = [l:agez] mixer_ptr(l)
  vtypedef mixer_ptr1 = [l:addr | l > null] mixer_ptr(l)
  assume mixer_type = mixer_ptr1

  extern fun queue_audio(uint, bool): void = "mac#aq_enqueue"
in
  implement init_mixer() = obtained where {
    extern fun init_desired(): mixer = "mac#init_desired"
    extern fun init_obtained(): mixer = "mac#init_obtained"
    extern fun SDL_OpenAudio(mixer, !mixer): int = "mac#SDL_OpenAudio"

    val desired = init_desired()
    val obtained = init_obtained()
    val () = if SDL_OpenAudio(desired, obtained) > 0 then
      fprintln!(stderr_ref, "Failed to open SDL2 audio.")
    val () = $SDL2e.SDL_PauseAudio(0)
  }

  implement close_mixer(mxr) = free_spec(mxr) where {
    extern fun free_spec(mixer): void = "mac#free_spec"
  }

  implement update_mixer(mxr, frames) = () where {
    extern fun get_freq(!mixer): int = "mac#get_freq"

    val freq = g0i2u(get_freq(mxr))
    val () = $SDL2e.SDL_LockAudio()
    val () = queue_audio(freq * g0i2u(b2i(ST.get())) / i2u(60), true)
    val () = queue_audio(freq * g0i2u(frames - b2i(ST.get())) / i2u(60), false)
    val () = $SDL2e.SDL_UnlockAudio()
  }
end
(* ****** ****** *)

local
  assume game_info_type = string
in
  implement load_game(info) =
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
    val mxr = init_mixer()
    val () = game_loop(dpy, mxr)
    val () = close_display(dpy)
    val () = close_mixer(mxr)
  }
end

(* End of [chip8-sdl.dats] *)