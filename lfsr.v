
`ifndef LFSR_H
`define LFSR_H

// =====================================================================
// lfsr.v
// Görev : Rastgele sayı üreteci
// Sahip : Şefikullah – Tur 7
// Not   : Port listesi TASLAKTIR — modül sahibi ihtiyaca göre değiştirebilir.
//         Değişiklik olursa README.md'deki sinyal tablosunu güncelleyin.
// =====================================================================

module lfsr(
  input  clk,
  input  reset,
  input  enable,
  output [7:0] rnd
);

  // TODO (Tur 7)
  assign rnd = 8'd0;

endmodule

`endif
