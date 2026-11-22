`ifndef LFSR_H
`define LFSR_H
/*
  lfsr.v — sahibi: Şefikullah — Tur 7
  Ne yapar : 8 bitlik LFSR; her saat çevriminde kayar, sözde rastgele sayı üretir.
  Girişler : clk, reset
  Çıkışlar : rnd
*/
module lfsr(
  input  wire       clk, reset,
  output wire [7:0] rnd
);
  assign rnd = 8'd0;          // TODO (Tur 7): Şefikullah dolduracak
endmodule
`endif
