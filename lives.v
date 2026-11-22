
`ifndef LIVES_H
`define LIVES_H

// =====================================================================
// lives.v
// Görev : Can sayacı
// Sahip : Sevde – Tur 6
// =====================================================================

module lives(
  input  clk,
  input  reset,
  input  player_hit,
  output [1:0] lives,
  output lives_zero
);

  // TODO (Tur 6)
  assign lives      = 2'd3;
  assign lives_zero = 1'b0;

endmodule

`endif
