`ifndef RENDERER_H
`define RENDERER_H
/*
  renderer.v — sahibi: Alperen — Tur 4, 8
  Ne yapar : Katmanları birleştirip piksel rengini üretir.
  Girişler : hpos, vpos, display_on, in_alien, alien_row, sub_x, sub_y,
             ship_on, bullet_on, ab_on, score_bcd, lives, state
  Çıkışlar : rgb ({b,g,r})
  Notlar   : Öncelik: mermi > uzaylı > gemi > zemin > arka plan.
*/
module renderer(
  input  wire [8:0]  hpos, vpos,
  input  wire        display_on,
  input  wire        in_alien,
  input  wire [1:0]  alien_row,
  input  wire [3:0]  sub_x, sub_y,
  input  wire        ship_on, bullet_on, ab_on,
  input  wire [15:0] score_bcd,
  input  wire [1:0]  lives,
  input  wire [2:0]  state,
  output wire [2:0]  rgb
);
  assign rgb = 3'b000;        // TODO (Tur 4, 8): Alperen dolduracak
endmodule
`endif
