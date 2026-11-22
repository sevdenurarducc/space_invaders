
`ifndef DEBOUNCE_H
`define DEBOUNCE_H

// =====================================================================
// debounce.v
// Görev : Tuş titreşimini temizler
// Sahip : Mine – Tur 2
// Not   : Port listesi TASLAKTIR — modül sahibi ihtiyaca göre değiştirebilir.
//         Değişiklik olursa README.md'deki sinyal tablosunu güncelleyin.
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
