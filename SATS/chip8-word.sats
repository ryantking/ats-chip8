(* ****** ****** *)
//
// chip8-word.sats
// Operators for chip8 words.
//
(* ****** ****** *)

staload "./chip8-base.sats"

(* ****** ****** *)

// Un-indexed word operations
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

(* ****** ****** *)

// Indexed word operations
fun Word_succ{b:word}(Word(b)):<> Word(b+1) = "mac#%"
fun Word_pred{b:word}(Word(b)):<> Word(b-1) = "mac#%"
fun Word_add{b1,b2:word}(Word(b1), Word(b2)):<> Word(b1+b2) = "mac#%"
fun Word_sub{b1,b2:word}(Word(b1), Word(b2)):<> Word(b1-b2) = "mac#%"
fun Word_mul{b1,b2:word}(Word(b1), Word(b2)):<> Word(b1*b2) = "mac#%"
fun Word_div{b1,b2:word}(Word(b1), Word(b2)):<> Word(b1/b2) = "mac#%"
fun Word_mod{b1,b2:word}(Word(b1), Word(b2)):<> Word(b1%b2) = "mac#%"
fun Word_lt{b1,b2:word}(Word(b1), Word(b2)):<> bool(b1 < b2) = "mac#%"
fun Word_lte{b1,b2:word}(Word(b1), Word(b2)):<> bool(b1 <= b2) = "mac#%"
fun Word_gt{b1,b2:word}(Word(b1), Word(b2)):<> bool(b1 > b2) = "mac#%"
fun Word_gte{b1,b2:word}(Word(b1), Word(b2)):<> bool(b1 >= b2) = "mac#%"
fun Word_eq{b1,b2:word}(Word(b1), Word(b2)):<> bool(b1 == b2) = "mac#%"
fun Word_neq{b1,b2:word}(Word(b1), Word(b2)):<> bool(b1 != b2) = "mac#%"
fun Word_max{b1,b2:word}(Word(b1), Word(b2)):<> Word(max(b1, b2)) = "mac#%"
fun Word_min{b1,b2:word}(Word(b1), Word(b2)):<> Word(min(b1, b2)) = "mac#%"
fun Word_isgtz{b:word}(Word(b)):<> bool(b > 0) = "mac#%"
fun Word_iseqz{b:word}(Word(b)):<> bool(b == 0) = "mac#%"
fun Word_isneqz{b:word}(Word(b)):<> bool(b != 0) = "mac#%"

// Overloads
overload succ with Word_succ
overload pred with Word_pred
overload + with Word_add
overload - with Word_sub
overload * with Word_mul
overload / with Word_div
overload % with Word_mod
overload < with Word_lt
overload <= with Word_lte
overload > with Word_gt
overload >= with Word_gte
overload = with Word_eq
overload != with Word_neq
overload max with Word_max
overload min with Word_min
overload isgtz with Word_isgtz
overload iseqz with Word_iseqz
overload isneqz with Word_isneqz

fun print_Word : print_type{b:word}(Word(b))
fun fprint_Word : fprint_type{b:word}(Word(b))
overload print with print_Word
overload fprint with fprint_Word

(* ****** ****** *)

(* End of [chip8-word-sats] *)