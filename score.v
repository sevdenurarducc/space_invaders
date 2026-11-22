
`ifndef SCORE_H
`define SCORE_H

// =====================================================================
// score.v
// Görev : BCD skor sayacı
// Sahip : Alperen – Tur 8
// Not   : Port listesi TASLAKTIR — modül sahibi ihtiyaca göre değiştirebilir.
//         Değişiklik olursa README.md'deki sinyal tablosunu güncelleyin.
// =====================================================================

module score(
  input  clk,
  input  reset,
  input  add,             // collision: bullet_hit_alien
  output [11:0] bcd       // 3 hane BCD
);

  // TODO (Tur 8)
  assign bcd = 12'd0;

endmodule

`endif
