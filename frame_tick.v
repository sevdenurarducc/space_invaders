
`ifndef FRAME_TICK_H
`define FRAME_TICK_H

// =====================================================================
// frame_tick.v
// Görev : Karede bir kez, tam 1 saat çevrimi boyunca 1 olan darbe üretir.
//         Işın görünür alanın son satırını geçtiğinde (vpos == V_DISPLAY)
//         ve satır başındayken (hpos == 0) tetiklenir. Böylece oyun
//         mantığı ekran çizilmezken (dikey boşlukta) güncellenir.
// Sahip : Sevde – Tur 1
// =====================================================================

module frame_tick(
  input  clk,
  input  reset,
  input  [8:0] hpos,
  input  [8:0] vpos,
  output reg tick        // her karede 1 çevrim 1 (~60 Hz)
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
