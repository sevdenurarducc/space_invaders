`ifndef ALIEN_BULLET_H
`define ALIEN_BULLET_H
/*
  alien_bullet.v — sahibi: Şefikullah — Tur 7
  Ne yapar : Belirli aralıklarla rastgele bir sütundaki canlı uzaylının altından
             mermi çıkarır; mermi her frame_tick'te aşağı iner, zemine gelince kaybolur.
  Girişler : clk, reset, frame_tick, playing, hit, rnd, form_x, form_y, alive, hpos, vpos
  Çıkışlar : active (ab_active), x, y (ab_x, ab_y), ab_on
*/
module alien_bullet(
  input  wire        clk, reset, frame_tick,
  input  wire        playing,         // game_fsm: PLAY durumunda 1
  input  wire        hit,
  input  wire [7:0]  rnd,
  input  wire [7:0]  form_x, form_y,
  input  wire [31:0] alive,
  input  wire [8:0]  hpos, vpos,
  output wire        active,
  output wire [7:0]  x, y,
  output wire        ab_on
);
  assign active = 1'b0;       // TODO (Tur 7): Şefikullah dolduracak
  assign x      = 8'd0;
  assign y      = 8'd0;
  assign ab_on  = 1'b0;
endmodule
`endif
