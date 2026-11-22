`ifndef GAME_FSM_H
`define GAME_FSM_H
/*
  game_fsm.v — sahibi: Sevde — Tur 1, 6
  Ne yapar : Ana oyun durum makinesi (Moore).
  Girişler : clk, reset, frame_tick, start_btn, player_hit, aliens_landed,
             aliens_left, lives
  Çıkışlar : state, new_game, playing, next_level

  Durumlar:
    TITLE       : başlık ekranı, start_btn beklenir
    PLAY        : oyun oynanıyor
    PLAYER_HIT  : gemi vuruldu, WAIT_FRAMES kare beklenir
    LEVEL_CLEAR : tüm uzaylılar vuruldu, WAIT_FRAMES kare beklenir
    GAME_OVER   : oyun bitti, WAIT_FRAMES kare beklenip TITLE'a dönülür

  Geçişler:
    TITLE       --start_btn---------------> PLAY        (new_game darbesi)
    PLAY        --aliens_landed-----------> GAME_OVER
    PLAY        --player_hit--------------> PLAYER_HIT
    PLAY        --aliens_left == 0--------> LEVEL_CLEAR
    PLAYER_HIT  --bekleme bitti, lives > 0-> PLAY
    PLAYER_HIT  --bekleme bitti, lives == 0> GAME_OVER
    LEVEL_CLEAR --bekleme bitti-----------> PLAY        (next_level darbesi)
    GAME_OVER   --bekleme bitti-----------> TITLE

  Notlar   : İki always bloğu (1: durum + sayaç register'ı, 2: sonraki durum).
             playing, next_level ve aliens_landed planın Ek A'sına eklendi.
*/

// Durum kodları: diğer dosyalar `GS_PLAY gibi kullanabilir
`define GS_TITLE       3'd0
`define GS_PLAY        3'd1
`define GS_PLAYER_HIT  3'd2
`define GS_LEVEL_CLEAR 3'd3
`define GS_GAME_OVER   3'd4

module game_fsm(
  input  wire       clk, reset, frame_tick,
  input  wire       start_btn,       // başlatma (ateş) tuşu
  input  wire       player_hit,      // collision: uzaylı mermisi gemiye çarptı
  input  wire       aliens_landed,   // collision: uzaylılar zemine indi
  input  wire [5:0] aliens_left,     // alien_formation: kalan uzaylı sayısı
  input  wire [1:0] lives,           // lives: kalan can
  output reg  [2:0] state,           // `GS_* kodları
  output wire       new_game,        // TITLE -> PLAY geçişinde 1 çevrim: skor/can/uzaylı sıfırla
  output wire       playing,         // state == PLAY (hareketleri durdurmak için)
  output wire       next_level       // LEVEL_CLEAR -> PLAY geçişinde 1 çevrim: uzaylıları yenile
);

  parameter [7:0] WAIT_FRAMES = 8'd120;   // 120 kare ≈ 2 saniye (60 Hz), en fazla 255
  localparam [7:0] WAIT_LAST = WAIT_FRAMES - 8'd1;

  reg [2:0] next_state;
  reg [7:0] wait_cnt;

  wire aliens_cleared = (aliens_left == 6'd0);
  wire lives_zero     = (lives == 2'd0);
  wire wait_done      = frame_tick && (wait_cnt == WAIT_LAST);

  // ---- 1. always: durum register'ı ve bekleme sayacı ----
  always @(posedge clk) begin
    if (reset) begin
      state    <= `GS_TITLE;
      wait_cnt <= 8'd0;
    end else begin
      state <= next_state;
      if (next_state != state)
        wait_cnt <= 8'd0;                    // yeni durumda sayaç sıfırdan başlar
      else if (frame_tick && wait_cnt != WAIT_LAST)
        wait_cnt <= wait_cnt + 8'd1;         // her karede bir artar, sonda durur
    end
  end

  // ---- 2. always: sonraki durum mantığı ----
  always @(*) begin
    next_state = state;
    case (state)
      `GS_TITLE:
        if (start_btn) next_state = `GS_PLAY;
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
