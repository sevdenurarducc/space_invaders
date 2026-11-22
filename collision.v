
`ifndef COLLISION_H
`define COLLISION_H

// =====================================================================
// collision.v
// Görev : Piksel çakışmasıyla çarpışma kontrolleri
// Sahip : Sevde – Tur 6
// Not   : Port listesi TASLAKTIR — modül sahibi ihtiyaca göre değiştirebilir.
//         Değişiklik olursa README.md'deki sinyal tablosunu güncelleyin.
// =====================================================================

module collision(
  input  clk,
  input  reset,
  input  tick,
  input  player_gfx,
  input  bullet_gfx,
  input  alien_gfx,
  input  alien_bullet_gfx,
  output bullet_hit_alien,  // oyuncu mermisi uzaylıya çarptı
  output player_hit         // uzaylı mermisi gemiye çarptı
);

  // TODO (Tur 6)
  assign bullet_hit_alien = 1'b0;
  assign player_hit       = 1'b0;

endmodule

`endif
