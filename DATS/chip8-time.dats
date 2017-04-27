(* ****** ****** *)
//
// chip8-time.dats
// Implementation of functions that manage timers and emulate the chip8 clock
// speed.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

staload TIME = "libats/libc/SATS/sys/time.sats"
staload MATH = "libats/libc/SATS/math.sats"

(* ****** ****** *)

implement get_time() = t where {
  var tv: $TIME.timeval?
  val err = $TIME.gettimeofday(tv)
  val () = assertloc(err >= 0)
  prval () = opt_unsome(tv)
  val t = $UN.cast{double}(tv.tv_sec) + $UN.cast{double}(tv.tv_usec) / 1000000
}
(* ****** ****** *)

local
  assume timer_type = ref(byte)
in
  implement timer_get(t) = !t
  implement timer_set(t, v) = !t := v
  implement timer_decr(t, v) = if !t > v then !t := !t - v else !t := b_0x0
end

(* ****** ****** *)

local
  extern castfn ref2timer(ref(byte)):<> timer
in
  implement DT = ref2timer(ref<byte>(b_0x0))
  implement ST = ref2timer(ref<byte>(b_0x0))
end

(* ****** ****** *)

local
  val t_start = ref<double>(0.0)
  val frames_done = ref<int>(0)
  val max_cons_insns = ref<int>(0)
in
  implement init_clock() = !t_start := get_time()

  implement sync_clock() = frames > 0 where {
    val t_cur = get_time()
    val t_passed = t_cur - !t_start
    val frames = g0float2int_double_int(t_passed * 60) - !frames_done
    val () = if frames > 0 then (
      !frames_done := !frames_done + frames;
      DT.decr(i2b(frames));
      ST.decr(i2b(frames));
    )
    val () = !max_cons_insns := max(frames, 1) * INSNS_PER_FRAME
    val () = if frames = 0 || waiting_for_key() then $SDL2.SDL_Delay(FRAME_LEN)
  }

  implement has_time() =
   if !max_cons_insns > 0 then (!max_cons_insns := !max_cons_insns - 1; true)
   else false
end


(* End of chip8-time.dats *)