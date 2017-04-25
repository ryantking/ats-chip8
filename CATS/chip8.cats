/*
 * chip8.cats
 * Functions to handle chip8 types.
 */

#ifndef CHIP8_CATS
#define CHIP8_CATS

/* ****** ****** */

typedef unsigned char  byte;
typedef unsigned short word;

/* ****** ****** */

ATSinline()
byte chip8_byte_succ(byte b) { return b+1; }

ATSinline()
byte chip8_byte_pred(byte b) { return b-1; }

ATSinline()
byte chip8_byte_add(byte b1, byte b2) { return b1 + b2; }

ATSinline()
byte chip8_byte_sub(byte b1, byte b2) { return b1 - b2; }

ATSinline()
byte chip8_byte_div(byte b1, byte b2) { return (byte) (b1 / b2); }

ATSinline()
byte chip8_byte_mul(byte b1, byte b2) { return (byte) (b1 * b2); }

ATSinline()
byte chip8_byte_mod(byte b1, byte b2) { return b1 % b2; }

ATSinline()
byte chip8_byte_lsl(byte b, int i) { return b << i; }

ATSinline()
byte chip8_byte_lsr(byte b, int i) { return b >> i; }

ATSinline()
byte chip8_byte_lnot(byte b) { return ~(b); }

ATSinline()
byte chip8_byte_lor(byte b1, byte b2) { return b1 | b2; }

ATSinline()
byte chip8_byte_lxor(byte b1, byte b2) { return b1 ^ b2; }

ATSinline()
byte chip8_byte_land(byte b1, byte b2) { return b1 & b2; }

ATSinline()
int chip8_byte_gt(byte b1, byte b2) { return b1 > b2; }

ATSinline()
int chip8_byte_gte(byte b1, byte b2) { return b1 >= b2; }

ATSinline()
int chip8_byte_lt(byte b1, byte b2) { return b1 < b2; }

ATSinline()
int chip8_byte_lte(byte b1, byte b2) { return b1 <= b2; }

ATSinline()
int chip8_byte_eq(byte b1, byte b2) { return b1 == b2; }

ATSinline()
int chip8_byte_neq(byte b1, byte b2) { return b1 != b2; }

ATSinline()
int chip8_byte_max(byte b1, byte b2) { return (b1 >= b2) ? b1 : b2; }

ATSinline()
int chip8_byte_min(byte b1, byte b2) { return (b1 <= b2) ? b1 : b2; }

ATSinline()
int chip8_byte_isgtz(byte b) { return b > 0; }

ATSinline()
int chip8_byte_iseqz(byte b) { return b == 0; }

ATSinline()
int chip8_byte_isneqz(byte b) { return b != 0; }

/* ****** ******* */

#define chip8_Byte_succ   chip8_byte_succ
#define chip8_Byte_pred   chip8_byte_pred
#define chip8_Byte_add    chip8_byte_add
#define chip8_Byte_sub    chip8_byte_sub
#define chip8_Byte_mul    chip8_byte_mul
#define chip8_Byte_div    chip8_byte_div
#define chip8_Byte_mod    chip8_byte_mod
#define chip8_Byte_lt     chip8_byte_lt
#define chip8_Byte_lte    chip8_byte_lte
#define chip8_Byte_gt     chip8_byte_gt
#define chip8_Byte_gte    chip8_byte_gte
#define chip8_Byte_eq     chip8_byte_eq
#define chip8_Byte_neq    chip8_byte_neq
#define chip8_Byte_max    chip8_byte_max
#define chip8_Byte_min    chip8_byte_min
#define chip8_Byte_isgtz  chip8_byte_isgtz
#define chip8_Byte_iseqz  chip8_byte_iseqz
#define chip8_Byte_isneqz chip8_byte_isneqz

/* ****** ****** */

ATSinline()
word chip8_word_succ(word b) { return b+1; }

ATSinline()
word chip8_word_pred(word b) { return b-1; }

ATSinline()
word chip8_word_add(word b1, word b2) { return b1 + b2; }

ATSinline()
word chip8_word_sub(word b1, word b2) { return b1 - b2; }

ATSinline()
word chip8_word_div(word b1, word b2) { return (word) (b1 / b2); }

ATSinline()
word chip8_word_mul(word b1, word b2) { return (word) (b1 * b2); }

ATSinline()
word chip8_word_mod(word b1, word b2) { return b1 % b2; }

ATSinline()
word chip8_word_lsl(word b, int i) { return b << i; }

ATSinline()
word chip8_word_lsr(word b, int i) { return b >> i; }

ATSinline()
word chip8_word_lnot(word b) { return ~(b); }

ATSinline()
word chip8_word_lor(word b1, word b2) { return b1 | b2; }

ATSinline()
word chip8_word_lxor(word b1, word b2) { return b1 ^ b2; }

ATSinline()
word chip8_word_land(word b1, word b2) { return b1 & b2; }

ATSinline()
int chip8_word_gt(word b1, word b2) { return b1 > b2; }

ATSinline()
int chip8_word_gte(word b1, word b2) { return b1 >= b2; }

ATSinline()
int chip8_word_lt(word b1, word b2) { return b1 < b2; }

ATSinline()
int chip8_word_lte(word b1, word b2) { return b1 <= b2; }

ATSinline()
int chip8_eq_word(word b1, word b2) { return b1 == b2; }

ATSinline()
int chip8_word_neq(word b1, word b2) { return b1 != b2; }

ATSinline()
int chip8_word_max(word b1, word b2) { return (b1 >= b2) ? b1 : b2; }

ATSinline()
int chip8_word_min(word b1, word b2) { return (b1 <= b2) ? b1 : b2; }

ATSinline()
int chip8_word_isgtz(word b) { return b > 0; }

ATSinline()
int chip8_word_iseqz(word b) { return b == 0; }

ATSinline()
int chip8_word_isneqz(word b) { return b != 0; }

/* ****** ******* */

#define chip8_Word_succ   chip8_word_succ
#define chip8_Word_pred   chip8_word_pred
#define chip8_Word_add    chip8_word_add
#define chip8_Word_sub    chip8_word_sub
#define chip8_Word_mul    chip8_word_mul
#define chip8_Word_div    chip8_word_div
#define chip8_Word_mod    chip8_word_mod
#define chip8_Word_lt     chip8_word_lt
#define chip8_Word_lte    chip8_word_lte
#define chip8_Word_gt     chip8_word_gt
#define chip8_Word_gte    chip8_word_gte
#define chip8_Word_eq     chip8_word_eq
#define chip8_Word_neq    chip8_word_neq
#define chip8_Word_max    chip8_word_max
#define chip8_Word_min    chip8_word_min
#define chip8_Word_isgtz  chip8_word_isgtz
#define chip8_Word_iseqz  chip8_word_iseqz
#define chip8_Word_isneqz chip8_word_isneqz

/* ****** ****** */

#endif

/* End of [chip8.cats] */
