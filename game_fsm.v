
`ifndef GAME_FSM_H
`define GAME_FSM_H

// =====================================================================
// game_fsm.v
// Görev : Ana oyun durum makinesi (başlangıç / oyun / kazandı / kaybetti)
// Sahip : Sevde – Tur 1, 6
// Not   : Port listesi TASLAKTIR — modül sahibi ihtiyaca göre değiştirebilir.
//         Değişiklik olursa README.md'deki sinyal tablosunu güncelleyin.
// =====================================================================

module game_fsm(
  input  clk,
  input  reset,
  input  tick,             // frame_tick
  input  start,            // başlatma tuşu (tek darbe)
  input  aliens_cleared,   // tüm uzaylılar vuruldu
  input  aliens_landed,    // uzaylılar alta ulaştı
  input  lives_zero,       // can bitti
  output [1:0] state       // 0: ATTRACT, 1: PLAY, 2: WIN, 3: GAME_OVER
);

  // TODO (Tur 1, 6)
  assign state = 2'd0;

endmodule

`endif
