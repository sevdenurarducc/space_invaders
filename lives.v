`ifndef LIVES_H
`define LIVES_H
/*
  lives.v — sahibi: Sevde — Tur 6
  Ne yapar : Can sayacı. Yeni oyunda 3, player_hit'te 1 azalır.
  Girişler : clk, reset, new_game, player_hit
  Çıkışlar : lives
*/
module lives(
  input  wire       clk, reset, new_game, player_hit,
  output wire [1:0] lives
);
  assign lives = 2'd3;        // TODO (Tur 6): Sevde dolduracak
endmodule
`endif
