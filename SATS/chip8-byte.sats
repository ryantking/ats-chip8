(* ****** ****** *)
//
// chip8-byte.sats
// Operators for chip8 bytes.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Byte operations
fun byte_succ(byte):<> byte = "mac#%"
fun byte_pred(byte):<> byte = "mac#%"
fun byte_add(byte, byte):<> byte = "mac#%"
fun byte_sub(byte, byte):<> byte = "mac#%"
fun byte_mul(byte, byte):<> byte = "mac#%"
fun byte_div(byte, byte):<> byte = "mac#%"
fun byte_mod(byte, byte):<> byte = "mac#%"
fun byte_lsl(byte, intGte(0)):<> byte = "mac#%"
fun byte_lsr(byte, intGte(0)):<> byte = "mac#%"
fun byte_lnot(byte):<> byte = "mac#%"
fun byte_lor(byte, byte):<> byte = "mac#%"
fun byte_lxor(byte, byte):<> byte = "mac#%"
fun byte_land(byte, byte):<> byte = "mac#%"
fun byte_lt(byte, byte):<> bool = "mac#%"
fun byte_lte(byte, byte):<> bool = "mac#%"
fun byte_gt(byte, byte):<> bool = "mac#%"
fun byte_gte(byte, byte):<> bool = "mac#%"
fun byte_eq(byte, byte):<> bool = "mac#%"
fun byte_neq(byte, byte):<> bool = "mac#%"
fun byte_max(byte, byte):<> byte = "mac#%"
fun byte_min(byte, byte):<> byte = "mac#%"
fun byte_isgtz(byte):<> bool = "mac#%"
fun byte_iseqz(byte):<> bool = "mac#%"
fun byte_isneqz(byte):<> bool = "mac#%"

// Overloads
overload succ with byte_succ
overload pred with byte_pred
overload + with byte_add
overload - with byte_sub
overload * with byte_mul
overload / with byte_div
overload % with byte_mod
overload lsl with byte_lsl
overload lsr with byte_lsr
overload lnot with byte_lnot
overload lor with byte_lor
overload lxor with byte_lxor
overload land with byte_land
overload < with byte_lt
overload <= with byte_lte
overload > with byte_gt
overload >= with byte_gte
overload = with byte_eq
overload != with byte_neq
overload max with byte_max
overload min with byte_min
overload isgtz with byte_isgtz
overload iseqz with byte_iseqz
overload isneqz with byte_isneqz

fun print_byte : print_type(byte)
fun fprint_byte : fprint_type(byte)
overload print with print_byte
overload fprint with fprint_byte

(* End of [chip8-byte-sats] *)