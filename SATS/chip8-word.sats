(* ****** ****** *)
//
// chip8-word.sats
// Operators for chip8 words.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Word Operations
fun word_succ(word):<> word = "mac#%"
fun word_pred(word):<> word = "mac#%"
fun word_add(word, word):<> word = "mac#%"
fun word_sub(word, word):<> word = "mac#%"
fun word_mul(word, word):<> word = "mac#%"
fun word_div(word, word):<> word = "mac#%"
fun word_mod(word, word):<> word = "mac#%"
fun word_lsl(word, intGte(0)):<> word = "mac#%"
fun word_lsr(word, intGte(0)):<> word = "mac#%"
fun word_lnot(word):<> word = "mac#%"
fun word_lor(word, word):<> word = "mac#%"
fun word_lxor(word, word):<> word = "mac#%"
fun word_land(word, word):<> word = "mac#%"
fun word_lt(word, word):<> bool = "mac#%"
fun word_lte(word, word):<> bool = "mac#%"
fun word_gt(word, word):<> bool = "mac#%"
fun word_gte(word, word):<> bool = "mac#%"
fun word_eq(word, word):<> bool = "mac#%"
fun word_neq(word, word):<> bool = "mac#%"
fun word_max(word, word):<> word = "mac#%"
fun word_min(word, word):<> word = "mac#%"
fun word_isgtz(word):<> bool = "mac#%"
fun word_iseqz(word):<> bool = "mac#%"
fun word_isneqz(word):<> bool = "mac#%"

// Overloads
overload succ with word_succ
overload pred with word_pred
overload + with word_add
overload - with word_sub
overload * with word_mul
overload / with word_div
overload % with word_mod
overload lsl with word_lsl
overload lsr with word_lsr
overload lnot with word_lnot
overload lor with word_lor
overload lxor with word_lxor
overload land with word_land
overload < with word_lt
overload <= with word_lte
overload > with word_gt
overload >= with word_gte
overload = with word_eq
overload != with word_neq
overload max with word_max
overload min with word_min
overload isgtz with word_isgtz
overload iseqz with word_iseqz
overload isneqz with word_isneqz

fun print_word : print_type(word)
fun fprint_word : fprint_type(word)
overload print with print_word
overload fprint with fprint_word

(* End of [chip8-word-sats] *)