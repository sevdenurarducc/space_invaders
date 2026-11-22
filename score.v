`ifndef SCORE_H
`define SCORE_H
/*
  score.v — sahibi: Alperen — Tur 8
  Ne yapar : 4 haneli BCD skor sayacı. kill gelince vurulan satıra göre
             10/20/30 ekler (onlar basamağına 1/2/3). Yeni oyunda sıfırlanır.
  Girişler : clk, reset, new_game, kill, alien_row
  Çıkışlar : score_bcd
*/
module score(
  input  wire        clk, reset, new_game, kill,
  input  wire [1:0]  alien_row,
  output wire [15:0] score_bcd
);
  assign score_bcd = 16'h0000; // TODO (Tur 8): Alperen dolduracak
endmodule
`endif
