
`ifndef EDGE_DETECT_H
`define EDGE_DETECT_H

// =====================================================================
// edge_detect.v
// Görev : Yükselen kenarda tek çevrimlik darbe (ateş tuşu)
// Sahip : Mine – Tur 2
// Not   : Port listesi TASLAKTIR — modül sahibi ihtiyaca göre değiştirebilir.
//         Değişiklik olursa README.md'deki sinyal tablosunu güncelleyin.
// =====================================================================

module edge_detect(
  input  clk,
  input  reset,
  input  in,
  output pulse
);

  // TODO (Tur 2)
  assign pulse = 1'b0;

endmodule

`endif
