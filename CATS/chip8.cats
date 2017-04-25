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
int chip8_eq_byte_byte(byte b1, byte b2) {
  return b1 == b2;
}

ATSinline()
int chip8_neq_byte_byte(byte b1, byte b2) {
  return b1 != b2;
}

ATSinline()
int chip8_gt_byte_byte(byte b1, byte b2) {
  return b1 > b2;
}

ATSinline()
int chip8_lt_byte_byte(byte b1, byte b2) {
  return b1 < b2;
}

ATSinline()
byte chip8_add_byte_byte(byte b1, byte b2) {
  return b1 + b2;
}

ATSinline()
byte chip8_sub_byte_byte(byte b1, byte b2) {
  return b1 - b2;
}

ATSinline()
byte chip8_div_byte_byte(byte b1, byte b2) {
  return (byte) (b1 / b2);
}

ATSinline()
byte chip8_mult_byte_byte(byte b1, byte b2) {
  return (byte) (b1 * b2);
}

ATSinline()
byte chip8_mod_byte_byte(byte b1, byte b2) {
  return b1 % b2;
}

ATSinline()
byte chip8_land_byte_byte(byte b1, byte b2) {
  return b1 & b2;
}

ATSinline()
byte chip8_lor_byte_byte(byte b1, byte b2) {
  return b1 | b2;
}

ATSinline()
byte chip8_lxor_byte_byte(byte b1, byte b2) {
  return b1 ^ b2;
}

ATSinline()
byte chip8_lsl_byte(byte b, int i) {
  return b << i;
}

ATSinline()
byte chip8_lsr_byte(byte b, int i) {
  return b >> i;
}

/* ****** ******* */

ATSinline()
int chip8_eq_word_word(word w1, word w2) {
  return w1 == w2;
}

ATSinline()
word chip8_add_word_word(word w1, word w2) {
  return w1 + w2;
}

ATSinline()
word chip8_sub_word_word(word w1, word w2) {
  return w1 - w2;
}

ATSinline()
word chip8_land_word_word(word w1, word w2) {
  return w1 & w2;
}

ATSinline()
word chip8_lsl_word(word w, int i) {
  return w << i;
}

ATSinline()
word chip8_lsr_word(word w, int i) {
  return w >> i;
}

/* ****** ****** */

#endif

/* End of [chip8.cats] */
