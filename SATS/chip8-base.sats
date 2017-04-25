(* ****** ****** *)
//
// chip8-base.sats
// Type definitions, basic functions, cast functions, and macros
//
(* ****** ****** *)

staload "./../mydepies.hats"

(* ****** ****** *)

// Basic Types

(* ****** ****** *)

abst@ype byte = uint8
abst@ype word = uint16

(* ****** ****** *)

macdef b_0x0 = $extval(byte, "0x0")
macdef b_0x1 = $extval(byte, "0x1")

macdef w_0x0   = $extval(word, "0x0")
macdef w_0x1   = $extval(word, "0x1")

(* ****** ****** *)

castfn byte_of_int(int):<> byte
castfn byte_of_uint(uint):<> byte
castfn byte_of_char(char):<> byte
castfn byte_of_word(word):<> byte
castfn word_of_int(int):<> word
castfn word_of_uint(uint):<> word
castfn word_of_byte(byte):<> word
castfn uint_of_byte(byte):<> uint
castfn uint_of_word(word):<> uint

symintr byte word
overload byte with byte_of_int
overload byte with byte_of_uint
overload byte with byte_of_char
overload byte with byte_of_word
overload word with word_of_int
overload word with word_of_uint
overload word with word_of_byte
overload uint with uint_of_byte
overload uint with uint_of_word

(* ****** ****** *)

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
fun lsl_word(word, int): word = "mac#%"
fun lsr_word(word, int): word = "mac#%"

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
overload lsl with lsl_word
overload lsr with lsr_word

(* ***** ****** *)

fun word_make_byte_byte(byte(*high*), byte(*low*)): word

symintr to_word
overload to_word with word_make_byte_byte

(* ****** ****** *)

fun print_byte : print_type(byte)
fun print_word : print_type(word)
fun fprint_byte : fprint_type(byte)
fun fprint_word : fprint_type(word)

overload print with print_byte
overload print with print_word
overload fprint with fprint_byte
overload fprint with fprint_word

(* End of [chip8-base.sats] *)