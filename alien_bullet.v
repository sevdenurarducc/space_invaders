
`ifndef ALIEN_BULLET_H
`define ALIEN_BULLET_H

// =====================================================================
// alien_bullet.v
// Görev : Uzaylı mermileri
// Sahip : Şefikullah – Tur 7
// =====================================================================

module alien_bullet(
  input  clk,
  input  reset,
  input  tick,
  input  [7:0] rnd,       // lfsr çıkışı
  input  hit,             // collision: player_hit
  input  [8:0] hpos,
  input  [8:0] vpos,
  output alien_bullet_gfx
);

  // TODO (Tur 7)
  assign alien_bullet_gfx = 1'b0;

endmodule

`endif
