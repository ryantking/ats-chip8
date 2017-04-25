#
# Makefile to manage the entire project
#
######

# Node Package Manager
NPM = npm

# File Removal Command
RM = rm -rf

# GNU Make
MAKE = make

# Build the emulator
all:: build
build:: ; $(MAKE) -C BUILD -f Makefile

# Install NPM Dependencies
npm-install:: ; $(NPM) install atscntrb-libsdl2

# Update NPM Dependencies
npm-install:: ; $(NPM) update atscntrb-libsdl2

# Clean Routines
clean:: ; $(MAKE) -C BUILD -f Makefile cleanall

cleanall:: clean
cleanall:: ; $(RM) node_modules

# End of [Makefile]
