`include "counter_Q4.v"
`timescale 1ns/1ps
module counter_Q4_tb;
  reg en,hold,rstn,clk,up_down;
  wire [7:0] cntr;
  counter_Q4 test(
    .en(en), .hold(hold), .rstn(rstn), .clk(clk), .up_down(up_down), .cntr(cntr)
  );
  always #5 clk= ~clk;
  initial begin
    clk = 0;
    rstn = 0;
    en = 0;
    up_down = 0;
    hold = 0;
    #10 rstn=1;
    #10 en=1; up_down=1;
    #50 hold=1;
    #20 hold=0;
    #20 up_down=0;
    #50 $finish;
  end
  initial begin
    $monitor("Time = %t | rstn = %b | en = %b | up_down = %b | hold = %b | cntr = %d",$time, rstn, en, up_down, hold, cntr);
    $dumpfile("waveform.vcd");
    $dumpvars(1);
  end
endmodule