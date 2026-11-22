`ifndef PLAYER_H
`define PLAYER_H
/*
  player.v — sahibi: Mine — Tur 2
  Ne yapar : Gemiyi sola/sağa hareket ettirir, gemi pikselini üretir.
  Girişler : clk, reset, frame_tick, playing, btn_left, btn_right, hpos, vpos
  Çıkışlar : player_x (geminin sol kenarı), ship_on
  Notlar   : Sadece frame_tick=1 ve playing=1 iken hareket eder. Sınırlar 8..232.
*/
module player(
  input  wire       clk, reset, frame_tick,
  input  wire       playing,          // game_fsm: PLAY durumunda 1
  input  wire       btn_left, btn_right,
  input  wire [8:0] hpos, vpos,
  output wire [7:0] player_x,
  output wire       ship_on
);
  assign player_x = 8'd120;   // TODO (Tur 2): Mine dolduracak
  assign ship_on  = 1'b0;
endmodule
`endif
