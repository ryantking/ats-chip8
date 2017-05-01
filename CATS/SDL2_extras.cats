/**
 * lambda8 - A Chip8 emulator written in ATS
 * Author: Ryan King (rtking@bu.edu)
 *
 * SDL_Extra.cats: Adds additional SDL features
 */

#ifndef SDL_EXTRA_CATS
#define SDL_EXTRA_CATS

#include <SDL2/SDL.h>

/* ****** ****** */

#define sdl_extra_SDL_OpenAudio     SDL_OpenAudio
#define sdl_extra_SDL_PauseAudio    SDL_PauseAudio

#define sdl_extra_SDL_InitSubSystem SDL_InitSubSystem
#define sdl_extra_SDL_AddTimer      SDL_AddTimer

#define sdl_extra_SDL_FillRect      SDL_FillRect

#define sdl_extra_SDL_LockAudio     SDL_LockAudio

#define sdl_extra_SDL_UnlockAudio   SDL_UnlockAudio

/* ****** ****** */

SDL_Keycode sdl_extra_GetKeysym(SDL_Event event) {
  return event.key.keysym.sym;
}

int sdl_extra_SDL_Keysym_eq(SDL_Keycode sym1, SDL_Keycode sym2) {
  return sym1 == sym2;
}

/* ****** ****** */

#endif

/* End of [SDL_Extra.cats] */
