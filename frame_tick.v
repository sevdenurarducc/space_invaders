`ifndef FRAME_TICK_H
`define FRAME_TICK_H
/*
  frame_tick.v — sahibi: Sevde — Tur 1
  Ne yapar : Karede bir kez, tam 1 saat çevrimi boyunca 1 olan darbe üretir.
  Girişler : clk, reset, hpos, vpos
  Çıkışlar : tick (üst modülde frame_tick adıyla dağıtılır)
  Notlar   : Işın görünür alanın son satırını geçtiğinde (vpos == V_DISPLAY) ve
             satır başındayken (hpos == 0) tetiklenir. Böylece oyun mantığı ekran
             çizilmezken (dikey boşlukta) güncellenir. Register çıkışlıdır.
*/
module frame_tick(
  input  wire       clk, reset,
  input  wire [8:0] hpos, vpos,
  output reg        tick       // her karede 1 çevrim 1 (~60 Hz)
);

  parameter [8:0] V_DISPLAY = 9'd240;  // hvsync_generator ile aynı olmalı

  always @(posedge clk) begin
    if (reset)
      tick <= 1'b0;
    else
      tick <= (vpos == V_DISPLAY) && (hpos == 9'd0);
  end

endmodule
`endif
