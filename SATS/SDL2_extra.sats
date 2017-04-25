(*
** SDL2_Extra.sats:
** Additional SDL functionality
** Author: Ryan King (rtking@bu.edu)
**
*)

(* ****** ****** *)

%{#
#include "../CATS/SDL2_extras.cats"
%} (*  end of [%{#] *)

#define ATS_EXTERN_PREFIX "sdl_extra_"

(* ****** ****** *)
//
#include "./../mydepies.hats"
//
(* ****** ****** *)
//
typedef SDL_Rect = $SDL2.SDL_Rect
typedef SDL_Event = $SDL2.SDL_Event
vtypedef SDL_Surface_ptr1 = $SDL2.SDL_Surface_ptr1

(* ****** ****** *)

(*- TYPES --------------------------------------------------------------------*)

// Callback function to get more audio
typedef SDL_AudioCallback = (ptr, uint8, int) -> void

typedef SDL_TimerCallback = (uint, ptr) -> uint

// Audio format specifier
typedef SDL_AudioFormat = uint16

// SDL Timer ID
typedef SDL_TimerID = uint

castfn t2u(timer: SDL_TimerID):<> uint

 // Detials on audio specification
typedef SDL_AudioSpec = $extype_struct"SDL_AudioSpec" of {
  freq     = int,               // DSP frequency (samples per second)
  format   = SDL_AudioFormat,   // audio data format
  channels = uint8,             // Number of separate sound channels
  samples  = uint16,            // Audio buffer size in samples (power of 2)
  callback = SDL_AudioCallback, // The function to call to get more audio data
  _rest    = undefined_t0ype    // Rest of the type (hidden to ATS)
}

(* SDL Color *)
typedef SDL_Color = $extype_struct"SDL_Color" of {
  r = uint, (* Red component                                                  *)
  g = uint, (* Green component                                                *)
  b = uint, (* Blue component                                                 *)
  a = uint  (* Alpha component                                                *)
}

typedef
SDL_Keycode = uint
and
SDL_Scancode = int

(* SDL Keysym *)
typedef
SDL_Keysym =
$extype_struct"SDL_Keysym" of
{
  scancode = SDL_Scancode,
  sym      = SDL_Keycode,
  mod      = usint,
  unused   = uint
}

fun
SDL_Keycode_eq
  (sym1: SDL_Keycode, sym2: SDL_Keycode): bool = "mac#%"

fun GetKeysym(event: !SDL_Event): SDL_Keycode = "mac#%"

(* SDL KeyBoard Event *)
typedef
SDL_KeyboardEvent =
$extype_struct"SDL_KeyboardEvent" of
{
  type = uint,
  timestamp = uint,
  windowID = uint,
  state = uchar,
  repeat = uchar,
  keysym = SDL_Keysym
}

castfn
SDL_KeyboardEvent_of_Event(SDL_Event):<> SDL_KeyboardEvent

symintr .toKeyboardEvent
overload .toKeyboardEvent with SDL_KeyboardEvent_of_Event

(*- DEFINES ------------------------------------------------------------------*)

// 8-bit
macdef AUDIO_S8     = $extval(SDL_AudioFormat, "AUDIO_S8"    )
macdef AUDIO_U8     = $extval(SDL_AudioFormat, "AUDIO_U8"    )

// 16-bit
macdef AUDIO_S16LSB = $extval(SDL_AudioFormat, "AUDIO_S16LSB")
macdef AUDIO_S16MSB = $extval(SDL_AudioFormat, "AUDIO_S16MSB")
macdef AUDIO_S16SYS = $extval(SDL_AudioFormat, "AUDIO_S16SYS")
macdef AUDIO_S16    = $extval(SDL_AudioFormat, "AUDIO_S16LSB")

macdef AUDIO_U16LSB = $extval(SDL_AudioFormat, "AUDIO_U16LSB")
macdef AUDIO_U16MSB = $extval(SDL_AudioFormat, "AUDIO_U16MSB")
macdef AUDIO_U16SYS = $extval(SDL_AudioFormat, "AUDIO_U16SYS")
macdef AUDIO_U16    = $extval(SDL_AudioFormat, "AUDIO_U16LSB")

// 32-bit
macdef AUDIO_S32LSB = $extval(SDL_AudioFormat, "AUDIO_S32LSB")
macdef AUDIO_S32MSB = $extval(SDL_AudioFormat, "AUDIO_S32MSB")
macdef AUDIO_S32SYS = $extval(SDL_AudioFormat, "AUDIO_S32SYS")
macdef AUDIO_S32    = $extval(SDL_AudioFormat, "AUDIO_S32LSB")

// Floating Point 32-bit
macdef AUDIO_F32LSB = $extval(SDL_AudioFormat, "AUDIO_F32LSB")
macdef AUDIO_F32MSB = $extval(SDL_AudioFormat, "AUDIO_F32MSB")
macdef AUDIO_F32SYS = $extval(SDL_AudioFormat, "AUDIO_F32SYS")
macdef AUDIO_F32    = $extval(SDL_AudioFormat, "AUDIO_F32LSB")

(* SDL Keycodes *)
macdef SDLK_1 = $extval(SDL_Keycode, "SDLK_1")
macdef SDLK_2 = $extval(SDL_Keycode, "SDLK_2")
macdef SDLK_3 = $extval(SDL_Keycode, "SDLK_3")
macdef SDLK_4 = $extval(SDL_Keycode, "SDLK_4")
macdef SDLK_q = $extval(SDL_Keycode, "SDLK_q")
macdef SDLK_w = $extval(SDL_Keycode, "SDLK_w")
macdef SDLK_e = $extval(SDL_Keycode, "SDLK_e")
macdef SDLK_r = $extval(SDL_Keycode, "SDLK_r")
macdef SDLK_a = $extval(SDL_Keycode, "SDLK_a")
macdef SDLK_s = $extval(SDL_Keycode, "SDLK_s")
macdef SDLK_d = $extval(SDL_Keycode, "SDLK_d")
macdef SDLK_f = $extval(SDL_Keycode, "SDLK_f")
macdef SDLK_z = $extval(SDL_Keycode, "SDLK_z")
macdef SDLK_x = $extval(SDL_Keycode, "SDLK_x")
macdef SDLK_c = $extval(SDL_Keycode, "SDLK_c")
macdef SDLK_v = $extval(SDL_Keycode, "SDLK_v")
macdef SDLK_ESCAPE = $extval(SDL_Keycode, "SDLK_ESCAPE")

macdef SDL_PRESSED = $extval(uchar, "SDL_PRESSED")
macdef SDL_RELEASED = $extval(uchar, "SDL_RELEASED")

(*- FUNCTIONS ----------------------------------------------------------------*)

(* SDL Audio Functions *)
fun SDL_OpenAudio(cPtr0(SDL_AudioSpec), cPtr0(SDL_AudioSpec)): int = "mac#%"
fun SDL_PauseAudio(int): void = "mac#%"

fun SDL_InitSubSystem(uint): int = "mac#%"

fun SDL_AddTimer(uint, SDL_TimerCallback, ptr): SDL_TimerID = "mac#%"

fun SDL_FillRect(!SDL_Surface_ptr1, cPtr0(SDL_Rect), uint): int = "mac#%"

(* End of [SDL_Extra.sats] *)