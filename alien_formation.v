`ifndef ALIEN_FORMATION_H
`define ALIEN_FORMATION_H
/*
  alien_formation.v — sahibi: Şefikullah — Tur 3, 7
  Ne yapar : 4x8 uzaylı dizisi (alive[31:0]) ve hareket FSM'si
             (MOVE_RIGHT -> DOWN_R -> MOVE_LEFT -> DOWN_L); uzaylı azaldıkça hızlanır.
  Girişler : clk, reset, frame_tick, playing, new_game, next_level,
             kill, kill_index, hpos, vpos
  Çıkışlar : form_x, form_y, alive, aliens_left, in_alien,
             alien_row, alien_col, sub_x, sub_y
  Notlar   : indeks = satır*8 + sütun. Hücre 16x16, uzaylı 8x8.
             new_game ve next_level gelince formasyon baştan kurulur.
*/
module alien_formation(
  input  wire        clk, reset, frame_tick,
  input  wire        playing,         // game_fsm: PLAY durumunda 1
  input  wire        new_game,        // game_fsm: yeni oyun başlarken 1 çevrim
  input  wire        next_level,      // game_fsm: yeni dalga başlarken 1 çevrim
  input  wire        kill,
  input  wire [4:0]  kill_index,
  input  wire [8:0]  hpos, vpos,
  output wire [7:0]  form_x, form_y,
  output wire [31:0] alive,
  output wire [5:0]  aliens_left,
  output wire        in_alien,
  output wire [1:0]  alien_row,
  output wire [2:0]  alien_col,
  output wire [3:0]  sub_x, sub_y
);
  // TODO (Tur 3, 7): Şefikullah dolduracak
  assign form_x      = 8'd64;
  assign form_y      = 8'd32;
  assign alive       = 32'hFFFF_FFFF;
  assign aliens_left = 6'd32;         // 0 olursa game_fsm LEVEL_CLEAR'a geçer
  assign in_alien    = 1'b0;
  assign alien_row   = 2'd0;
  assign alien_col   = 3'd0;
  assign sub_x       = 4'd0;
  assign sub_y       = 4'd0;
endmodule
`endif
