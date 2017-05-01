#
# Makefile to build the emulator
#
######

# ATS Compiler
PATSCC = ${PATSHOME}/bin/patscc -w -Wall -D_REENTRANT -lpthread -lportaudio
PATSOPT = ${PATSHOME}/bin/pastopt

# Includes
INCLUDE += -DATS_MEMALLOC_LIBC
INCLUDE += -I./../node_modules

# Source Files
DEPS = ../SATS/chip8.sats ../DATS/chip8-sdl.dats
OBJS = $(filter-out $(DEPS),$(wildcard ../?ATS/*.?ats ../*.hats))

# Flags
FLAGS_SDL = $(shell pkg-config sdl2 --cflags --libs)

# Build the emulator, with SDL by default
all:: SDL
SDL:: chip8

# Build the emulator with SDL
chip8: $(DEPS) $(OBJS)
	$(PATSCC) $(INCLUDE) -o $@ $(word 1,$^) $(word 2,$^) $(FLAGS_SDL)

# Clean routines
clean:: ; @rm -f *~
clean:: ; @rm -f *_?ats.c
clean:: ; @rm -f *_?ats.o

cleanall:: clean
cleanall:: ; @rm -f chip8

# End of [Makefile]
