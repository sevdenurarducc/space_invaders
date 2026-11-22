
// =====================================================================
// space_invaders_top.v — ana dosya, tüm modülleri bağlar
// Sahip : Sevde – Tur 1, 6, 9
// 8bitworkshop üst modül olarak "top" adını kullanır.
// =====================================================================

`include "hvsync_generator.v"
`include "frame_tick.v"
`include "game_fsm.v"
`include "collision.v"
`include "lives.v"
`include "edge_detect.v"
`include "debounce.v"
`include "player.v"
`include "bullet.v"
`include "alien_formation.v"
`include "alien_bullet.v"
`include "lfsr.v"
`include "sprite_rom.v"
`include "renderer.v"
`include "score.v"

module top(clk, reset, hsync, vsync, rgb);

  input clk, reset;
  output hsync, vsync;
  output [2:0] rgb;
  wire display_on;
  wire [8:0] hpos;
  wire [8:0] vpos;

  hvsync_generator hvsync_gen(
    .clk(clk),
    .reset(reset),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(display_on),
    .hpos(hpos),
    .vpos(vpos)
  );

  // TODO (Tur 1): frame_tick ve game_fsm örneklerini buraya ekle.
  // TODO (Tur 6, 9): diğer modülleri sırayla bağla.

  // Geçici test deseni — renderer bağlanınca kaldırılacak
  wire r = display_on && hpos[4];
  wire g = display_on && vpos[4];
  wire b = display_on && hpos[0];
  assign rgb = {b,g,r};

endmodule
