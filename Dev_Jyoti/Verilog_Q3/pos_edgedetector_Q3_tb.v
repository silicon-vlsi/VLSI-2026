`include "pos_edgedetector_Q3.v"
`timescale 1ns/1ps
module pos_edgedetector_Q3_tb;
  reg clk,rstn,a;
  wire b;
  pos_edgedetector_Q3 test(
    .clk(clk), .rstn(rstn), .a(a), .b(b)
  );
  always #5 clk= ~clk;
  initial begin
    rstn=0;
    clk=0;
    a=0;
    #10 rstn=1;
    #10 a=1; //+ve edge
    #10 a=1;
    #10 a=0;
    #10 a=1; //+ve edge
    #10 a=0;
    #10 rstn=0;
    #10 rstn=1;
    #50 $finish;
  end
  initial begin
    $monitor("Time=%0t | rstn=%b | clk=%b | a=%b | b=%b", $time,rstn,clk,a,b);
    $dumpfile("waveform.vcd");
    $dumpvars(1);
  end
endmodule