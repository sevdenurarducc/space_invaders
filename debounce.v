
`ifndef DEBOUNCE_H
`define DEBOUNCE_H

// =====================================================================
// debounce.v
// Görev : Tuş titreşimini temizler
// Sahip : Mine – Tur 2
// =====================================================================

module debounce(
  input  clk,
  input  reset,
  input  btn_in,
  output btn_out
);

  // TODO (Tur 2)
  assign btn_out = btn_in;

endmodule

`endif
