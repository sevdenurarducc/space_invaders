`ifndef EDGE_DETECT_H
`define EDGE_DETECT_H
/*
  edge_detect.v — sahibi: Mine — Tur 2
  Ne yapar : Tuşa basıldığı anda tek saat çevrimlik darbe üretir (fire_pulse).
  Girişler : clk, in
  Çıkışlar : pulse
*/
module edge_detect(
  input  wire clk, in,
  output wire pulse
);
  assign pulse = 1'b0;        // TODO (Tur 2): Mine dolduracak
endmodule
`endif
