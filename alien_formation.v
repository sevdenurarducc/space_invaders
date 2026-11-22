
`ifndef ALIEN_FORMATION_H
`define ALIEN_FORMATION_H

// =====================================================================
// alien_formation.v
// Görev : Uzaylı dizisi ve hareket FSM'si
// Sahip : Şefikullah – Tur 3, 7
// =====================================================================

module alien_formation(
  input  clk,
  input  reset,
  input  tick,
  input  playing,         // game_fsm: PLAY durumunda 1, değilse hareket durur
  input  new_game,        // game_fsm: yeni oyun başlarken 1 çevrim 1
  input  next_level,      // game_fsm: yeni dalga başlarken 1 çevrim 1
  input  hit,             // collision: bullet_hit_alien
  input  [8:0] hpos,
  input  [8:0] vpos,
  output alien_gfx,
  output aliens_cleared,
  output aliens_landed
);

  // TODO (Tur 3, 7)
  assign alien_gfx      = 1'b0;
  assign aliens_cleared = 1'b0;
  assign aliens_landed  = 1'b0;

endmodule

`endif
