
`ifndef PLAYER_H
`define PLAYER_H

// =====================================================================
// player.v
// Görev : Gemi hareketi ve gemi çizimi
// Sahip : Mine – Tur 2
// =====================================================================

module player(
  input  clk,
  input  reset,
  input  tick,
  input  playing,         // game_fsm: PLAY durumunda 1, değilse hareket durur
  input  left,
  input  right,
  input  [8:0] hpos,
  input  [8:0] vpos,
  output [7:0] player_x,
  output player_gfx
);

  // TODO (Tur 2)
  assign player_x   = 8'd120;
  assign player_gfx = 1'b0;

endmodule

`endif
