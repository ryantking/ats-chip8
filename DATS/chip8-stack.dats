(* ****** ****** *)
//
// chip8-stack.dats
// Implementations of stack pop and push functions.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

(* ****** ****** *)

local
  val stk_ptr = ref<istk>(0)
  val stk_sz = i2sz(STACK_SIZE)
  val stk = arrayref_make_elt<word>(stk_sz, w_0x0)
in
  implement stack_pop() =
    let val i = !stk_ptr in
      if i > 0 then (!stk_ptr := i-1; w2imem(stk[i-1]))
      else $raise StackUnderflow()
    end

  implement stack_push(a) =
    let val i = !stk_ptr in
      if i < STACK_SIZE then (stk[i] := (a); !stk_ptr := i+1)
      else $raise StackOverflow()
    end
end

(* End of chip8-stack.dats *)