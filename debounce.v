`ifndef DEBOUNCE_H
`define DEBOUNCE_H
/*
  debounce.v — sahibi: Mine — Tur 2
  Ne yapar : Sayaçlı basit titreşim temizleyici.
  Girişler : clk, in
  Çıkışlar : out
  Notlar   : Simülatörde gerekmeyebilir, ama sunumda anlatılacak.
*/
module debounce(
  input  wire clk, in,
  output wire out
);
  assign out = in;            // TODO (Tur 2): Mine dolduracak
endmodule
`endif
