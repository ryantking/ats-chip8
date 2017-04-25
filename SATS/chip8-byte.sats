(* ****** ****** *)
//
// chip8-byte.sats
// Operators for chip8 bytes.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Un-indexed byte operations
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

(* ****** ****** *)

// Indexed byte operations
fun Byte_succ{b:byte}(Byte(b)):<> Byte(b+1) = "mac#%"
fun Byte_pred{b:byte}(Byte(b)):<> Byte(b-1) = "mac#%"
fun Byte_add{b1,b2:byte}(Byte(b1), Byte(b2)):<> Byte(b1+b2) = "mac#%"
fun Byte_sub{b1,b2:byte}(Byte(b1), Byte(b2)):<> Byte(b1-b2) = "mac#%"
fun Byte_mul{b1,b2:byte}(Byte(b1), Byte(b2)):<> Byte(b1*b2) = "mac#%"
fun Byte_div{b1,b2:byte}(Byte(b1), Byte(b2)):<> Byte(b1/b2) = "mac#%"
fun Byte_mod{b1,b2:byte}(Byte(b1), Byte(b2)):<> Byte(b1%b2) = "mac#%"
fun Byte_lt{b1,b2:byte}(Byte(b1), Byte(b2)):<> bool(b1 < b2) = "mac#%"
fun Byte_lte{b1,b2:byte}(Byte(b1), Byte(b2)):<> bool(b1 <= b2) = "mac#%"
fun Byte_gt{b1,b2:byte}(Byte(b1), Byte(b2)):<> bool(b1 > b2) = "mac#%"
fun Byte_gte{b1,b2:byte}(Byte(b1), Byte(b2)):<> bool(b1 >= b2) = "mac#%"
fun Byte_eq{b1,b2:byte}(Byte(b1), Byte(b2)):<> bool(b1 == b2) = "mac#%"
fun Byte_neq{b1,b2:byte}(Byte(b1), Byte(b2)):<> bool(b1 != b2) = "mac#%"
fun Byte_max{b1,b2:byte}(Byte(b1), Byte(b2)):<> Byte(max(b1, b2)) = "mac#%"
fun Byte_min{b1,b2:byte}(Byte(b1), Byte(b2)):<> Byte(min(b1, b2)) = "mac#%"
fun Byte_isgtz{b:byte}(Byte(b)):<> bool(b > 0) = "mac#%"
fun Byte_iseqz{b:byte}(Byte(b)):<> bool(b == 0) = "mac#%"
fun Byte_isneqz{b:byte}(Byte(b)):<> bool(b != 0) = "mac#%"

// Overloads
overload succ with Byte_succ
overload pred with Byte_pred
overload + with Byte_add
overload - with Byte_sub
overload * with Byte_mul
overload / with Byte_div
overload % with Byte_mod
overload < with Byte_lt
overload <= with Byte_lte
overload > with Byte_gt
overload >= with Byte_gte
overload = with Byte_eq
overload != with Byte_neq
overload max with Byte_max
overload min with Byte_min
overload isgtz with Byte_isgtz
overload iseqz with Byte_iseqz
overload isneqz with Byte_isneqz

fun print_Byte : print_type{b:byte}(Byte(b))
fun fprint_Byte : fprint_type{b:byte}(Byte(b))
overload print with print_Byte
overload fprint with fprint_Byte

(* ****** ****** *)

(* End of [chip8-byte-sats] *)