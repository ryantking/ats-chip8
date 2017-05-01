(* ****** ****** *)
//
// chip8-loop.dats
// Implementation of functions that handle the main emulation loop.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

staload STDLIB = "libats/libc/SATS/stdlib.sats"

(* ****** ****** *)

local
  assume opcode_type = '{
    p = byte,
    x = word,
    y = word,
    n = byte,
    kk = byte,
    nnn = word
  }

  fun fetch(): word = opc where {
    val b_hi = Mem(w2imem(PC.get()))
    val () = PC.incr(w_0x1)
    val b_lo = Mem(w2imem(PC.get()))
    val () = PC.incr(w_0x1)
    val opc = (b2w(b_hi) lsl 0x8) lor b2w(b_lo)
  }

  fun decode(opc: word): opcode = '{
    p = w2b((opc lsr 0xC) land w_0xF),
    x = (opc lsr 0x8) land w_0xF,
    y = (opc lsr 0x4) land w_0xF,
    n = w2b(opc land w_0xF),
    kk = w2b(opc land w_0xFF),
    nnn = opc land w_0xFFF
  }

  fun execute(opc: opcode): void =
    let
      fun check_p(p: byte): bool = opc.p = p
      fun check_pn(p: byte, n: byte): bool = opc.p = p && opc.n = n
      fun check_pkk(p: byte, kk: byte): bool = opc.p = p && opc.kk = kk
      fun check_pnnn(p: byte, nnn: word): bool = opc.p = p && opc.nnn = nnn
      fun get_Vx(): byte = (V(opc.x)).get()
      fun set_Vx(b: byte): void = (V(opc.x)).set(b)
      fun get_Vy(): byte = (V(opc.y)).get()
      fun set_Vy(b: byte): void = (V(opc.y)).set(b)
      fun set_Vf(test: bool): void =
        if test then (V(w_0xF)).set(b_0x1) else (V(w_0xF)).set(b_0x0)

      overload Vx with get_Vx
      overload Vx with set_Vx
      overload Vy with get_Vy
      overload Vy with set_Vy
      overload Vf with set_Vf
    in
      ifcase
      | check_pkk(b_0x0, i2b(0xE0)) => clear_screen()
      | check_pkk(b_0x0, i2b(0xEE)) => PC.set(stack_pop())
      | check_p(b_0x1) => PC.set(opc.nnn)
      | check_p(b_0x2) => (stack_push(PC.get()); PC.set(opc.nnn))
      | check_p(b_0x3) => if (Vx() = opc.kk) then PC.incr(w_0x2)
      | check_p(b_0x4) => if (Vx() != opc.kk) then PC.incr(w_0x2)
      | check_p(b_0x5) => if (Vx() = Vy()) then PC.incr(w_0x2)
      | check_p(b_0x6) => Vx(opc.kk)
      | check_p(b_0x7) => Vx(Vx() + opc.kk)
      | check_pn(b_0x8, b_0x0) => Vx(Vy())
      | check_pn(b_0x8, b_0x1) => Vx(Vx() lor Vy())
      | check_pn(b_0x8, b_0x2) => Vx(Vx() land Vy())
      | check_pn(b_0x8, b_0x3) => Vx(Vx() lxor Vy())
      | check_pn(b_0x8, b_0x4) => (Vf(Vx() > (b_0xFF - Vy())); Vx(Vx() + Vy()))
      | check_pn(b_0x8, b_0x5) => (Vf(Vx() > Vy()); Vx(Vx() - Vy()))
      | check_pn(b_0x8, b_0x6) => (Vf((Vx() land b_0x1) = b_0x1); Vx(Vx() lsr 1))
      | check_pn(b_0x8, b_0x7) => (Vf(Vy() > Vx()); Vx(Vy() - Vx()))
      | check_pn(b_0x8, b_0xE) => (Vf((Vx() lsr 7) = b_0x1); Vx(Vx() lsl 1))
      | check_pn(b_0x9, b_0x0) => if (Vx() != Vy()) then PC.incr(w_0x2)
      | check_p(b_0xA) => I.set(opc.nnn)
      | check_p(b_0xB) => PC.set(b2w((V(w_0x0)).get()) + opc.nnn)
      | check_p(b_0xC) => Vx(i2b($STDLIB.rand() % 256) land opc.kk)
      | check_p(b_0xD) => draw_y(0) where {
        val () = (V(w_0xF)).set(b_0x0)
        val x = b2i(Vx())
        val y = b2i(Vy())
        val height = b2i(opc.n)

        fun draw_x(row: byte, x_off: natLt(SPR_WIDTH), y_off: int):<cloref1> void =
          if x_off < SPR_WIDTH && x + x_off < SCR_WIDTH then
            let
              val _x = $UN.cast{natLt(SCR_WIDTH)}(x + x_off)
              val _y = $UN.cast{natLt(SCR_HEIGHT)}(y + y_off)
              val pix = (row lsr (SPR_WIDTH - 1 - x_off)) land b_0x1
              val () = if pix = b_0x1 then (
                if Scr(_x, _y) = b_0x1 then (
                  (V(w_0xF)).set(b_0x1);
                  Scr(_x, _y, b_0x0)
                ) else Scr(_x, _y, b_0x1)
              )
            in
              if succ(x_off) < SPR_WIDTH then draw_x(row, succ(x_off), y_off)
            end

        fun draw_y(y_off: int):<cloref1> void = (
          if y_off < height && y + y_off < SCR_HEIGHT then (
            draw_x(Mem($UN.cast{imem}(w2i(I.get()) + y_off)), 0, y_off);
            draw_y(succ(y_off))
          )
        )
      }
      | check_pkk(b_0xE, i2b(0x9E)) =>
        if check_key($UN.cast{nkey}(Vx())) then PC.incr(w_0x2)
      | check_pkk(b_0xE, i2b(0xA1)) =>
        if not(check_key($UN.cast{nkey}(Vx()))) then PC.incr(w_0x2)
      | check_pkk(b_0xF, b_0x7) => Vx(DT.get())
      | check_pkk(b_0xF, b_0xA) => (
          !waiting_for_key := true;
          !waiting_key_reg := V(opc.x)
        )
      | check_pkk(b_0xF, i2b(0x15)) => DT.set(Vx())
      | check_pkk(b_0xF, i2b(0x18)) => ST.set(Vx())
      | check_pkk(b_0xF, i2b(0x1E)) => (
          Vf(w2i(I.get()) + b2i(Vx()) > 0xFFF);
          I.set(I.get() + b2w(Vx()))
        )
      | check_pkk(b_0xF, i2b(0x29)) => I.set(b2w(Vx() * b_0x5))
      | check_pkk(b_0xF, i2b(0x33)) => (
          Mem(w2imem(I.get()), Vx() / i2b(100) % i2b(10));
          Mem(w2imem(I.get()), Vx() / i2b(10) % i2b(10));
          Mem(w2imem(I.get()), Vx() % i2b(10))
        )
      | check_pkk(b_0xF, i2b(0x55)) => store(w_0x0, opc.x) where {
          fun store(i: word, n: word): void = (
            Mem(w2imem(I.get() + i), (V(i)).get());
            if (succ(w2i(i)) < NUM_REGS) && (i < n) then store(i + w_0x1, n)
          )
        }
      | check_pkk(b_0xF, i2b(0x65)) => fill(w_0x0, opc.x) where {
          fun fill(i: word, n: word): void = (
            (V(i)).set(Mem(w2imem(I.get() + i)));
            if succ(w2i(i)) < NUM_REGS then if i < n then fill(i + w_0x1, n)
          )
        }
      | _ => $raise UnknownOpcode((b2w(opc.p) lsl 0xC) lor opc.nnn)
    end


  fun exec_insns(): void =
    if has_time() && not(!waiting_for_key) then
      let
        val opc = fetch()
        val opc = decode(opc)
      in
        (execute(opc); exec_insns())
      end

in
  implement game_loop(dpy) =
    let
      val () = exec_insns()
      val () = poll_kb()
      val frames = sync_clock()
      val () = if frames > 0 then update_display(dpy)
    in
      if !running then game_loop(dpy)
    end
end

(* End of chip8-loop.dats *)