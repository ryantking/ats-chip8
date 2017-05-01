#
# Makefile to build the emulator
#
######

# ATS Compiler
PATSCC = ${PATSHOME}/bin/patscc -w
PATSOPT = ${PATSHOME}/bin/pastopt

# Includes
INCLUDE += -DATS_MEMALLOC_LIBC
INCLUDE += -I./../node_modules

# Source Files
DEPS = ../SATS/chip8.sats ../DATS/chip8-sdl.dats
OBJS = $(filter-out $(DEPS),$(wildcard ../?ATS/*.?ats ../*.hats))

# Flags
FLAGS_SDL += $(shell pkg-config sdl2 --cflags --libs)
FLAGS_PA += $(shell pkg-config portaudio-2.0 --cflags --libs)

# Build the emulator, with SDL by default
all:: SDL
SDL:: chip8

# Build the emulator with SDL
chip8: $(DEPS) $(OBJS)
	$(PATSCC) -o $@ $(word 1,$^) $(word 2,$^) $(INCLUDE) $(FLAGS_SDL) $(FLAGS_PA)

# Clean routines
clean:: ; @rm -f *~
clean:: ; @rm -f *_?ats.c
clean:: ; @rm -f *_?ats.o

cleanall:: clean
cleanall:: ; @rm -f chip8

# End of [Makefile]
