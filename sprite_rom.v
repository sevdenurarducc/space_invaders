
`ifndef SPRITE_ROM_H
`define SPRITE_ROM_H

// =====================================================================
// sprite_rom.v
// Görev : Uzaylı ve rakam desenleri
// Sahip : Alperen – Tur 4, 8
// Not   : Port listesi TASLAKTIR — modül sahibi ihtiyaca göre değiştirebilir.
//         Değişiklik olursa README.md'deki sinyal tablosunu güncelleyin.
// =====================================================================

module sprite_rom(
  input  [4:0] char,      // 0-9: rakamlar, 16+: uzaylı kareleri
  input  [2:0] row,
  output [7:0] bits
);

  // TODO (Tur 4, 8)
  assign bits = 8'd0;

endmodule

`endif
