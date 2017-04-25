(* ****** ****** *)
//
// chip8-loop.dats
// Implementation of functions that handle the main emulation loop.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

(* ****** ****** *)

(* ****** ****** *)

local
  val interrupted = ref<bool>(false)
  val Vx = ref<breg>(V(0))
  val Vy = ref<breg>(V(0))
  val nnn = ref<word>(w_0x0)
  val kk = ref<byte>(b_0x0)
  val n = ref<byte>(b_0x0)

  fun fetch(): word = o where {
    val b_hi = Mem(w2imem(PC.get()))
    val () = PC.incr(w_0x1)
    val b_lo = Mem(w2imem(PC.get()))
    val () = PC.incr(w_0x1)
    val o = (b2w(b_hi) lsl 0x8) lor b2w(b_lo)
  }

  fun decode(o: word): byte = '{
    p = w2b(o lsr 0xc),
    Vx = V(b2nreg(w2b(o lsr 0x8) land i2b(0xF))),
    Vy = V(b2nreg(w2b(o lsr 0x4) land i2b(0xF))),
    nnn = o land i2w(0xFFF),
    kk = w2b(o land i2w(0xFF)),
    n = w2b(o land i2w(0xF))
  }

  // Functions to get (and set in the case of the registers) the individual parts
  // of the opcode.
  fun opcode_get_first(opcode): byte
  fun opcode_get_Vx(opcode): breg
  fun opcode_set_Vx(opcode, byte): void
  fun opcode_get_Vy(opcode): breg
  fun opcode_set_Vy(opcode, byte): void
  fun opcode_get_last3(opcode): word
  fun opcode_get_last2(opcode): byte
  fun opcode_get_last1(opcode): byte

// Shorthands
overload first with opcode_get_first
overload Vx with opcode_get_Vx
overload Vx with opcode_set_Vx
overload Vy with opcode_get_Vy
overload Vy with opcode_set_Vy
overload last3 with opcode_get_last3
overload last2 with opcode_get_last2
overload last1 with opcode_get_last1
in
  implement quit() = !interrupted := true

  implement game_loop(dpy) =
    let
      val o = fetch()
      val o = decode(o)
      val () = poll_kb()
    in
      if not !interrupted then game_loop(dpy)
    end
end

(* End of chip8-loop.dats *)