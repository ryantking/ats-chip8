#
# Makefile to build the emulator
#
######

# ATS Compiler
PATSCC = ${PATSHOME}/bin/patscc
PATSOPT = ${PATSHOME}/bin/pastopt

# File Removal Command
RM = rm -f

# Includes
INCLUDE += -DATS_MEMALLOC_LIBC
INCLUDE += -I./../node_modules

# Executable
EXEC = chip8

# Source Files
DIR = ./..
SATS = $(DIR)/SATS/chip8.sats
DATS_SDL += $(DIR)/DATS/chip8-sdl.dats

# Flags
FLAGS_SDL = $(shell pkg-config sdl2 --cflags --libs)

# Build the emulator, with SDL by default
all:: SDL

# Build the emulator with SDL
SDL: $(SATS) $(DATS_SDL)
	$(PATSCC) $(INCLUDE) -o $(EXEC) $^ $(FLAGS_SDL)

# Clean routines
clean:: ; $(RM) *~
clean:: ; $(RM) *_?ats.c
clean:: ; $(RM) *_?ats.o

cleanall:: clean
cleanall:: ; $(RM) chip8

# End of [Makefile]
