`ifndef BULLET_H
`define BULLET_H
/*
  bullet.v — sahibi: Mine — Tur 5
  Ne yapar : Oyuncu mermisi FSM'si (READY -> FLYING -> READY) ve çizimi.
  Girişler : clk, reset, frame_tick, playing, fire_pulse, hit (pb_hit),
             player_x, hpos, vpos
  Çıkışlar : active (pb_active), x, y (pb_x, pb_y), bullet_on
  Notlar   : Aynı anda tek mermi. Ekranın üstüne gelince veya hit=1 olunca READY.
*/
module bullet(
  input  wire       clk, reset, frame_tick,
  input  wire       playing,          // game_fsm: PLAY durumunda 1
  input  wire       fire_pulse, hit,
  input  wire [7:0] player_x,
  input  wire [8:0] hpos, vpos,
  output wire       active,
  output wire [7:0] x, y,
  output wire       bullet_on
);
  assign active    = 1'b0;    // TODO (Tur 5): Mine dolduracak
  assign x         = 8'd0;
  assign y         = 8'd0;
  assign bullet_on = 1'b0;
endmodule
`endif
