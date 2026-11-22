`ifndef COLLISION_H
`define COLLISION_H
/*
  collision.v — sahibi: Sevde — Tur 6
  Ne yapar : Oyuncu mermisi -> uzaylı (kill, kill_index, pb_hit),
             uzaylı mermisi -> gemi (player_hit),
             uzaylılar zemine indi mi (aliens_landed).
  Girişler : clk, frame_tick, pb_active, pb_x, pb_y, form_x, form_y, alive,
             ab_active, ab_x, ab_y, player_x
  Çıkışlar : kill, kill_index, pb_hit, player_hit, aliens_landed
  Notlar   : Hücre = (pb_x - form_x) >> 4, (pb_y - form_y) >> 4 (Şefikullah'ın formülü).
*/
module collision(
  input  wire        clk, frame_tick,
  input  wire        pb_active,
  input  wire [7:0]  pb_x, pb_y,
  input  wire [7:0]  form_x, form_y,
  input  wire [31:0] alive,
  input  wire        ab_active,
  input  wire [7:0]  ab_x, ab_y, player_x,
  output wire        kill,
  output wire [4:0]  kill_index,
  output wire        pb_hit,
  output wire        player_hit,
  output wire        aliens_landed    // zemine inerse oyun biter
);
  assign kill          = 1'b0;  // TODO (Tur 6): Sevde dolduracak
  assign kill_index    = 5'd0;
  assign pb_hit        = 1'b0;
  assign player_hit    = 1'b0;
  assign aliens_landed = 1'b0;
endmodule
`endif
