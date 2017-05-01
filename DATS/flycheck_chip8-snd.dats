(* ****** ****** *)
//
// chip8-snd.dats
// Implementations of functions to manage the virtual screen.
//
(* ****** ****** *)

#ifndef CHIP8_MAIN
#include "./../staloadall.hats"
#include "./../mydepies.hats"
#endif

%{^
typedef struct {
    float left_phase;
    float right_phase;
} paTestData;

static paTestData snd_data;

static int chip8_snd_callback( const void *inputBuffer, void *outputBuffer,
                           unsigned long framesPerBuffer,
                           const PaStreamCallbackTimeInfo* timeInfo,
                           PaStreamCallbackFlags statusFlags,
                           void *userData )
{
    /* Cast data passed through stream to our structure. */
    paTestData *data = (paTestData*)userData;
    float *out = (float*)outputBuffer;
    unsigned int i;
    (void) inputBuffer; /* Prevent unused variable warning. */

    for( i=0; i<framesPerBuffer; i++ )
    {
        *out++ = data->left_phase;  /* left */
        *out++ = data->right_phase;  /* right */
        /* Generate simple sawtooth phaser that ranges between -1.0 and 1.0. */
        data->left_phase += 0.01f;
        /* When signal reaches top, drop back down. */
        if( data->left_phase >= 1.0f ) data->left_phase -= 2.0f;
        /* higher pitch so we can distinguish left and right. */
        data->right_phase += 0.03f;
        if( data->right_phase >= 1.0f ) data->right_phase -= 2.0f;
    }
    return 0;
}
%}

#define ATS_EXTERN_PREFIX "chip8_snd_"

(* ****** ****** *)

local
  val buff_sz = i2sz(AUDIO_BUFF_SIZE)
  val buffer = array_ptr_alloc<float>(buff_sz)
  val sound_started = ref<bool>(false)

  fun sqr_wave(angle: float): float = if (angle % TAU) < PI then 1.0f else ~1.0f

  extern fun callback(
    inp_buff: ptr, outp_buff: ptr, frames_per_buff: ulint,
    time_info: ptr, flags: $PA.PaStreamCallbackFlags, data: ptr
  ): int = "mac#%"
in
  implement sound_thread() =
    let
      fun sound_loop(stream: $PA.PaStream): void = sound_loop(stream) where {
        val _ = usleep(1000000 / 60)
        val () = if ST.get() > b_0x0 then (
          if not(!sound_started) then
            let
              val err = $PA.Pa_StartStream(stream)
              val () = !sound_started := true
            in
              if err > 0 then
                fprintln!(stderr_ref, "Error opening sound stream")
            end;

            ST.decr(b_0x1);

            if ST.get() = b_0x0 && !sound_started then
              let
                val err = $PA.Pa_StopStream(stream)
                val () = !sound_started := false
              in
                if err > 0 then
                  fprintln!(stderr_ref, "Error closing sound stream")
              end
        )
      }

      val data = $extval(ptr, "&snd_data")
      var stream : $PA.PaStream?
      val err = $PA.Pa_Initialize()
    in
      if err > 0 then fprintln!(stderr_ref, "PortAudio failed to initialize")
      else
        let
          val buff_sz = $extval(ulint, "512")
          val err = $PA.Pa_OpenDefaultStream(
            stream, 0, 2, $PA.paFloat32, $UN.cast{double}(SAMPLE_RATE),
            buff_sz, callback, data
          )
        in
          if err > 0 then
            fprintln!(stderr_ref, "PortAudio failed to open stream")
          else (
            sound_loop(stream);
            let val err = $PA.Pa_Terminate() in
              if err > 0 then
                fprintln!(stderr_ref, "PortAudio failed to terminate")
            end
          )
        end
    end
end

(* End of chip8-snd.dats *)