
// =====================================================================
// test_game_fsm_top.v — game_fsm testi
// Sahip : Sevde – Tur 1
//
// Her durum farklı bir arka plan rengiyle gösterilir:
//   TITLE = mavi, PLAY = yeşil, PLAYER_HIT = kırmızı,
//   LEVEL_CLEAR = sarı, GAME_OVER = mor
// Sol üstteki küçük beyaz kare saniyede bir yanıp söner (frame_tick testi).
//
// Tuşlar (8bitworkshop switches_p1):
//   Space  (bit 4) = start
//   Shift  (bit 5) = player_hit
//   Yukarı (bit 2) = aliens_cleared
//   Aşağı  (bit 3) = aliens_landed
//   Sol    (bit 0) = lives_zero (PLAYER_HIT'te basılı tutulursa GAME_OVER)
//
// Çalıştırmak için bu dosyayı ana dosya olarak açın:
//   ...&file=test_game_fsm_top.v
// =====================================================================

`include "hvsync_generator.v"
`include "frame_tick.v"
`include "game_fsm.v"

module top(clk, reset, hsync, vsync, rgb, switches_p1);

  input clk, reset;
  input [7:0] switches_p1;
  output hsync, vsync;
  output reg [2:0] rgb;     // {b,g,r}

  wire display_on;
  wire [8:0] hpos;
  wire [8:0] vpos;

  hvsync_generator hvsync_gen(
    .clk(clk), .reset(reset),
    .hsync(hsync), .vsync(vsync),
    .display_on(display_on),
    .hpos(hpos), .vpos(vpos)
  );

  wire tick;
  frame_tick ft(
    .clk(clk), .reset(reset),
    .hpos(hpos), .vpos(vpos),
    .tick(tick)
  );

  wire [2:0] state;
  wire playing, new_game, next_level;
  game_fsm fsm(
    .clk(clk), .reset(reset), .tick(tick),
    .start(switches_p1[4]),
    .player_hit(switches_p1[5]),
    .aliens_cleared(switches_p1[2]),
    .aliens_landed(switches_p1[3]),
    .lives_zero(switches_p1[0]),
    .state(state),
    .playing(playing), .new_game(new_game), .next_level(next_level)
  );

  // tick sayacı: 60 karede bir kare yanıp söner (frame_tick testi)
  reg [5:0] frames;
  reg blink;
  always @(posedge clk) begin
    if (reset) begin
      frames <= 6'd0;
      blink  <= 1'b0;
    end else if (tick) begin
      if (frames == 6'd59) begin
        frames <= 6'd0;
        blink  <= ~blink;
      end else
        frames <= frames + 6'd1;
    end
  end

  wire blink_box = blink && hpos < 9'd16 && vpos < 9'd16;

  reg [2:0] bg;
  always @(*) begin
    case (state)
      `GS_TITLE:       bg = 3'b100;  // mavi
      `GS_PLAY:        bg = 3'b010;  // yeşil
      `GS_PLAYER_HIT:  bg = 3'b001;  // kırmızı
      `GS_LEVEL_CLEAR: bg = 3'b011;  // sarı
      `GS_GAME_OVER:   bg = 3'b101;  // mor
      default:         bg = 3'b111;  // beyaz = hatalı durum
    endcase
    if (!display_on)    rgb = 3'b000;
    else if (blink_box) rgb = 3'b111;
    else                rgb = bg;
  end

endmodule
