
`ifndef GAME_FSM_H
`define GAME_FSM_H

// =====================================================================
// game_fsm.v
// Görev : Ana oyun durum makinesi.
// Sahip : Sevde – Tur 1, 6
//
// Durumlar:
//   TITLE       : başlık ekranı, start beklenir
//   PLAY        : oyun oynanıyor
//   PLAYER_HIT  : gemi vuruldu, WAIT_FRAMES kare beklenir
//   LEVEL_CLEAR : tüm uzaylılar vuruldu, WAIT_FRAMES kare beklenir
//   GAME_OVER   : oyun bitti, WAIT_FRAMES kare beklenip TITLE'a dönülür
//
// Geçişler:
//   TITLE       --start-------------------> PLAY        (new_game darbesi)
//   PLAY        --aliens_landed-----------> GAME_OVER
//   PLAY        --player_hit--------------> PLAYER_HIT
//   PLAY        --aliens_cleared----------> LEVEL_CLEAR
//   PLAYER_HIT  --bekleme bitti, can var--> PLAY
//   PLAYER_HIT  --bekleme bitti, can yok--> GAME_OVER
//   LEVEL_CLEAR --bekleme bitti-----------> PLAY        (next_level darbesi)
//   GAME_OVER   --bekleme bitti-----------> TITLE
//
// Yapı: iki always bloğu (1: durum + sayaç register'ı, 2: sonraki durum).
// =====================================================================

// Durum kodları: diğer dosyalar `GS_PLAY gibi kullanabilir
`define GS_TITLE       3'd0
`define GS_PLAY        3'd1
`define GS_PLAYER_HIT  3'd2
`define GS_LEVEL_CLEAR 3'd3
`define GS_GAME_OVER   3'd4

module game_fsm(
  input  clk,
  input  reset,
  input  tick,             // frame_tick
  input  start,            // başlatma tuşu
  input  player_hit,       // collision: uzaylı mermisi gemiye çarptı
  input  aliens_cleared,   // alien_formation: tüm uzaylılar vuruldu
  input  aliens_landed,    // alien_formation: uzaylılar zemine indi
  input  lives_zero,       // lives: can kalmadı
  output reg [2:0] state,  // `GS_* kodları
  output playing,          // state == PLAY (hareketleri durdurmak için)
  output new_game,         // TITLE -> PLAY geçişinde 1 çevrim: skor/can/uzaylı sıfırla
  output next_level        // LEVEL_CLEAR -> PLAY geçişinde 1 çevrim: uzaylıları yenile
);

  parameter [7:0] WAIT_FRAMES = 8'd120;   // 120 kare ≈ 2 saniye (60 Hz), en fazla 255
  localparam [7:0] WAIT_LAST = WAIT_FRAMES - 8'd1;

  reg [2:0] next_state;
  reg [7:0] wait_cnt;

  wire wait_done = tick && (wait_cnt == WAIT_LAST);

  // ---- 1. always: durum register'ı ve bekleme sayacı ----
  always @(posedge clk) begin
    if (reset) begin
      state    <= `GS_TITLE;
      wait_cnt <= 8'd0;
    end else begin
      state <= next_state;
      if (next_state != state)
        wait_cnt <= 8'd0;                    // yeni durumda sayaç sıfırdan başlar
      else if (tick && wait_cnt != WAIT_LAST)
        wait_cnt <= wait_cnt + 8'd1;         // her karede bir artar, sonda durur
    end
  end

  // ---- 2. always: sonraki durum mantığı ----
  always @(*) begin
    next_state = state;
    case (state)
      `GS_TITLE:
        if (start) next_state = `GS_PLAY;
      `GS_PLAY:
        if (aliens_landed)       next_state = `GS_GAME_OVER;
        else if (player_hit)     next_state = `GS_PLAYER_HIT;
        else if (aliens_cleared) next_state = `GS_LEVEL_CLEAR;
      `GS_PLAYER_HIT:
        if (wait_done) next_state = lives_zero ? `GS_GAME_OVER : `GS_PLAY;
      `GS_LEVEL_CLEAR:
        if (wait_done) next_state = `GS_PLAY;
      `GS_GAME_OVER:
        if (wait_done) next_state = `GS_TITLE;
      default:
        next_state = `GS_TITLE;
    endcase
  end

  assign playing    = (state == `GS_PLAY);
  assign new_game   = (state == `GS_TITLE)       && (next_state == `GS_PLAY);
  assign next_level = (state == `GS_LEVEL_CLEAR) && (next_state == `GS_PLAY);

endmodule

`endif
