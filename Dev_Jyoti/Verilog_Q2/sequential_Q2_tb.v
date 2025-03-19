`include "sequential_Q2.v"
`timescale 1ns/1ps
module sequential_Q2_tb;
  reg clk,rstn,a;
  wire b,c;
  sequential_Q2 test(
    .clk(clk), .rstn(rstn), .a(a), .b(b), .c(c)
  );
  always #5 clk= ~clk;
  initial begin
    clk=0;
    rstn=0;
    a=0;
    #10 rstn=1;
    #10 a=1;
    #10 a=0;
    #10 a=1;
    #10 a=0;
    #50;
    $finish;
  end
  initial begin
    $monitor("Time=%0t | clk=%b | rstn=%b | a=%b | b=%b | c=%b", $time,clk,rstn,a,b,c);
    $dumpfile("waveform.vcd");
    $dumpvars(1);
  end
endmodule