(* ****** ****** *)
//
// chip8-mem.dats
// Functions that read and write to main memory.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#endif

(* ****** ****** *)

local
  val mem_sz = i2sz(MEM_SIZE)
  val memory = arrayref_make_elt<byte>(mem_sz, b_0x0)

  extern castfn index_of_imem(imem):<> natLt(MEM_SIZE)
  overload imem2index with index_of_imem
in
  implement memory_get_at(i) = memory[imem2index(i)]
  implement memory_set_at(i, b) = memory[imem2index(i)] := b


end

(* ****** ****** *)

implement imem_of_word(w) =
  let extern castfn w2imem(word):<> imem in
    if w2i(w) >= 0 && w2i(w) < MEM_SIZE then w2imem(w)
    else $raise SegFault(w2i(w))
  end

implement imem_of_int(i) =
  let extern castfn i2imem(int):<> imem in
    if i >= 0 && i < MEM_SIZE then i2imem(i)
    else $raise SegFault(i)
  end

(* End of chip8-mem.dats *)