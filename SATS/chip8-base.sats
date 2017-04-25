(* ****** ****** *)
//
// chip8-base.sats
// Type definitions, basic functions, cast functions, defines, and macros.
//
(* ****** ****** *)

staload "./../mydepies.hats"

(* ****** ****** *)

// Basic Types

(* ****** ****** *)

// Types that are stored by chip8
abst@ype byte = uint8
abst@ype word = uint16
abst@ype byte(b:int) = uint8(b)
abst@ype word(w:int) = uint16(w)

(* ****** ****** *)

// Commonly used byte values
macdef b_0x0 = $extval(byte, "0x0")
macdef b_0x1 = $extval(byte, "0x1")
macdef b_0x2 = $extval(byte, "0x2")
macdef b_0x3 = $extval(byte, "0x3")
macdef b_0x4 = $extval(byte, "0x4")
macdef b_0x5 = $extval(byte, "0x5")
macdef b_0x6 = $extval(byte, "0x6")
macdef b_0x7 = $extval(byte, "0x7")
macdef b_0x8 = $extval(byte, "0x8")
macdef b_0x9 = $extval(byte, "0x9")
macdef b_0xA = $extval(byte, "0xA")
macdef b_0xB = $extval(byte, "0xB")
macdef b_0xC = $extval(byte, "0xC")
macdef b_0xD = $extval(byte, "0xD")
macdef b_0xE = $extval(byte, "0xE")
macdef b_0xF = $extval(byte, "0xF")

// Commonly used word values
macdef w_0x0   = $extval(word, "0x0")
macdef w_0x1   = $extval(word, "0x1")
macdef w_0xF   = $extval(word, "0xF")
macdef w_0xFF  = $extval(word, "0xFF")
macdef w_0xFFF = $extval(word, "0xFFF")

(* ****** ****** *)

// Cast functions for going between bytes, words, and (u)ints
castfn byte_of_int(int):<> byte
castfn byte_of_char(char):<> byte
castfn byte_of_word(word):<> byte
castfn word_of_int(int):<> word
castfn word_of_byte(byte):<> word
castfn int_of_byte(byte):<> int
castfn int_of_word(word):<> int

// Shorthands
overload i2b with byte_of_int
overload c2b with byte_of_char
overload w2b with byte_of_word
overload i2w with word_of_int
overload b2w with word_of_byte
overload b2i with int_of_byte
overload w2i with int_of_word

(* ****** ****** *)

// Basic comparison, arithmetic, and logical operations with bytes and words
fun eq_byte_byte(byte, byte): bool = "mac#%"
fun neq_byte_byte(byte, byte): bool = "mac#%"
fun gt_byte_byte(byte, byte): bool = "mac#%"
fun lt_byte_byte(byte, byte): bool = "mac#%"
fun add_byte_byte(byte, byte): byte = "mac#%"
fun sub_byte_byte(byte, byte): byte = "mac#%"
fun mult_byte_byte(byte, byte): byte = "mac#%"
fun div_byte_byte(byte, byte): byte = "mac#%"
fun mod_byte_byte(byte, byte): byte = "mac#%"
fun land_byte_byte(byte, byte): byte = "mac#%"
fun lor_byte_byte(byte, byte): byte = "mac#%"
fun lxor_byte_byte(byte, byte): byte = "mac#%"
fun lsl_byte(byte, int): byte = "mac#%"
fun lsr_byte(byte, int): byte = "mac#%"

fun eq_word_word(word, word): bool = "mac#%"
fun add_word_word(word, word): word = "mac#%"
fun sub_word_word(word, word): word = "mac#%"
fun land_word_word(word, word): word = "mac#%"
fun lor_word_word(word, word): word = "mac#%"
fun lsl_word(word, int): word = "mac#%"
fun lsr_word(word, int): word = "mac#%"

// Allow the normal symbols to be used with bytes and words
overload = with eq_byte_byte
overload != with neq_byte_byte
overload > with gt_byte_byte
overload < with lt_byte_byte
overload + with add_byte_byte
overload - with sub_byte_byte
overload * with mult_byte_byte
overload / with div_byte_byte
overload % with mod_byte_byte
overload land with land_byte_byte
overload lor with lor_byte_byte
overload lxor with lxor_byte_byte
overload lsl with lsl_byte
overload lsr with lsr_byte

overload = with eq_word_word
overload + with add_word_word
overload - with sub_word_word
overload land with land_word_word
overload lor with lor_word_word
overload lsl with lsl_word
overload lsr with lsr_word

(* ***** ****** *)

// Print functions for bytes and words
fun print_byte : print_type(byte)
fun print_word : print_type(word)
fun fprint_byte : fprint_type(byte)
fun fprint_word : fprint_type(word)

// Allow bytes and words to be printed normally
overload print with print_byte
overload print with print_word
overload fprint with fprint_byte
overload fprint with fprint_word

(* ****** ****** *)

// Memory Types

(* ****** ****** *)

// Size of memory in bytes
#define MEM_SIZE 0x1000

// Type to represent the chip8's main memory
abstype memory_type = ptr
typedef memory = memory_type

// Index to chip8 memory
typedef imem = natLt(MEM_SIZE)

// Segmentation fault for invalid memory access
exception SegFault of (int)

// Convert ints and words to valid memory locations. They are not implemented
// as cast functions because the functions must check if they are within the
// memory, not just blindly convert.
fun imem_of_word(word): imem
fun imem_of_int(int): imem

// Allow simple casting to memory indicies
overload w2imem with imem_of_word
overload i2imem with imem_of_int

// Expcetions for loading the game
exception GameNotFound of ()
exception GameTooLarge of ()

// Type to represent info about where to locate the game data. For example,
// with SDL, it will just be a string representing a game fname.
abstype game_info_type = ptr
typedef game_info = game_info_type

(* ****** ****** *)

// CPU Register Types

(* ****** ****** *)

// Number of 8-bit registers
#define NUM_REGS 16

// Initial address of the program counter
#define PC_START 0x200

// An 8-bit register
abstype breg_type = ptr
typedef breg = breg_type

// Expcetion for accessing an invalid register
exception InvalidRegister of (byte)

// A register number (0 through 15)
typedef nreg = natLt(NUM_REGS)

// Turns a byte into a reg number
fun nreg_of_byte(byte): nreg

overload b2nreg with nreg_of_byte

(* ****** ****** *)

// 16-bit registers
abstype wreg_type = ptr
typedef wreg = wreg_type

(* ****** ****** *)

// Time Types

(* ****** ****** *)

// Chip8 timer frequency and clock
#define FREQ 60

// Unix enoch time in seconds (with precission)
typedef time_t = double

// A special timer register
abstype timer_type = ptr
typedef timer = timer_type

(* ****** ****** *)

// Stack Types

(* ****** ****** *)

// Size of the stack in words
#define STACK_SIZE 16

// Stack index (its stored as an array)
typedef istk = natLte(STACK_SIZE)

// The chip8's stack
abstype stack_type = ptr
typedef stack = stack_type

// Expcetions for pushing to a full stack or popping from an empty oen
exception StackOverflow of ()
exception StackUnderflow of ()

(* ****** ****** *)

// Screen Types

(* ****** ****** *)

// Width and height of the emulated screen
#define SCR_WIDTH  64
#define SCR_HEIGHT 32

// Number of real pixels used to represent each chip8 pixel
#define SCALE 8

// Width of a sprite in chip8 pixels
#define SPR_WIDTH 8

// Number of instructions to be performed per frame
#define INSNS_PER_FRAME 14

// X and Y coordinates of the emulated screen
typedef scr_x = natLt(SCR_WIDTH)
typedef scr_y = natLt(SCR_HEIGHT)

// Chip8 screen
abstype screen_type = ptr
typedef screen = screen_type

// Display the chip8 screen is drawn to
absvtype display_type = ptr
vtypedef display = display_type

(* ****** ****** *)

// Input Types

(* ****** ****** *)

// Number of keys on the chip8 keyboard (0-15 in hex)
#define NUM_KEYS 16

// A key number (0-15)
typedef nkey = natLt(NUM_KEYS)

// A key event
datatype key_event =
  | key_press of (nkey)
  | key_release of (nkey)
  | key_quit of ()

(* ****** ****** *)

// Opcode Type

(* ****** ****** *)

// Each opcode has a unique combination of the first 4 bits and the last
// 0-3 4-bit sections with all non-identify 4-bit sections containing additional
// data for the instruction.
datatype opcode =
  | PNNN of (byte, word)
  | PXKK of (byte, breg byte)
  | PXYK of (byte, breg, breg, byte)

(* End of [chip8-base.sats] *)