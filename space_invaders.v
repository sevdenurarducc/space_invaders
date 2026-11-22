
// =====================================================================
// space_invaders.v — ana dosya, tüm modülleri bağlar
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

  // frame_tick ve game_fsm hazır (Tur 1); tek başına testi: test_game_fsm_top.v
  // TODO (Tur 6, 9): diğer modülleri sırayla bağla.

  // Zemin çizgisi: uzaylılar bu satıra inerse oyun biter (aliens_landed).
  // GEÇİCİ — renderer bağlanınca oraya taşınacak.
  localparam [8:0] GROUND_Y = 9'd230;
  wire ground_gfx = display_on && (vpos == GROUND_Y || vpos == GROUND_Y + 9'd1);

  assign rgb = ground_gfx ? 3'b010 : 3'b000;   // {b,g,r}: yeşil zemin, siyah arka plan

endmodule
