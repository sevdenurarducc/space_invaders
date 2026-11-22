
`ifndef RENDERER_H
`define RENDERER_H

// =====================================================================
// renderer.v
// Görev : Katmanları birleştirip renk üretir
// Sahip : Alperen – Tur 4, 8
// =====================================================================

module renderer(
  input  display_on,
  input  player_gfx,
  input  bullet_gfx,
  input  alien_gfx,
  input  alien_bullet_gfx,
  input  score_gfx,
  output [2:0] rgb        // {b,g,r}
);

  // TODO (Tur 4, 8)
  assign rgb = 3'b000;

endmodule

`endif
