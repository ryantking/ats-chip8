#
# Makefile to manage the entire project
#
######

# Directories
BUILD_DIR = BUILD
NODE_DIR = node_modules

# NPM Dependencies
DEPS = atscntrb-libsdl2 atscntrb-rk-libportaudio

# Build the emulator (default)
all:: build
build: $(addprefix $(NODE_DIR)/,$(DEPS)) $(BUILD_DIR)/chip8
$(BUILD_DIR)/chip8:: ; @make -C $(BUILD_DIR) chip8

# Install missing dependencies
$(NODE_DIR)/%:: ; @make npm-install

# Install all NPM Dependencies
npm-install:: ; @npm install $(DEPS)

# Update NPM Dependencies
npm-update:: ; @npm update atscntrb-libsdl2

# Clean Routines
clean:: ; @make -C BUILD -f Makefile cleanall

cleanall:: clean
cleanall:: ; @rm -rf $(NODE_DIR)

# End of [Makefile]
