
`ifndef SCORE_H
`define SCORE_H

// =====================================================================
// score.v
// Görev : BCD skor sayacı
// Sahip : Alperen – Tur 8
// =====================================================================

module score(
  input  clk,
  input  reset,
  input  new_game,        // game_fsm: yeni oyun başlarken 1 çevrim 1
  input  add,             // collision: bullet_hit_alien
  output [11:0] bcd       // 3 hane BCD
);

  // TODO (Tur 8)
  assign bcd = 12'd0;

endmodule

`endif
