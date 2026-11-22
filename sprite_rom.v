`ifndef SPRITE_ROM_H
`define SPRITE_ROM_H
/*
  sprite_rom.v — sahibi: Alperen — Tur 4, 8
  Ne yapar : Uzaylı desenleri (3 tip, 8x8). Tur 8'de rakamlar (0-9) eklenecek.
  Girişler : alien_type (üst satır 0, ikinci satır 1, alttaki iki satır 2), row
  Çıkışlar : bits (o satırın 8 bitlik deseni)
*/
module sprite_rom(
  input  wire [1:0] alien_type,
  input  wire [2:0] row,
  output wire [7:0] bits
);
  assign bits = 8'd0;         // TODO (Tur 4, 8): Alperen dolduracak
endmodule
`endif
