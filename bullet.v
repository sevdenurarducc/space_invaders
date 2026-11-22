
`ifndef BULLET_H
`define BULLET_H

// =====================================================================
// bullet.v
// Görev : Oyuncu mermisi FSM'si ve çizimi
// Sahip : Mine – Tur 5
// Not   : Port listesi TASLAKTIR — modül sahibi ihtiyaca göre değiştirebilir.
//         Değişiklik olursa README.md'deki sinyal tablosunu güncelleyin.
// =====================================================================

module bullet(
  input  clk,
  input  reset,
  input  tick,
  input  fire,            // edge_detect çıkışı
  input  hit,             // collision: bullet_hit_alien
  input  [7:0] player_x,
  input  [8:0] hpos,
  input  [8:0] vpos,
  output active,
  output bullet_gfx
);

  // TODO (Tur 5)
  assign active     = 1'b0;
  assign bullet_gfx = 1'b0;

endmodule

`endif
