
`ifndef FRAME_TICK_H
`define FRAME_TICK_H

// =====================================================================
// frame_tick.v
// Görev : Karede bir kez 1 saat çevrimi süren darbe üretir
// Sahip : Sevde – Tur 1
// Not   : Port listesi TASLAKTIR — modül sahibi ihtiyaca göre değiştirebilir.
//         Değişiklik olursa README.md'deki sinyal tablosunu güncelleyin.
// =====================================================================

module frame_tick(
  input  clk,
  input  reset,
  input  [8:0] hpos,
  input  [8:0] vpos,
  output tick          // her karede 1 çevrim 1
);

  // TODO (Tur 1)
  assign tick = 1'b0;

endmodule

`endif
