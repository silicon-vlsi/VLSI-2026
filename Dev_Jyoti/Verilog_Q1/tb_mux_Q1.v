`include "mux_Q1.v"
module tb_mux_Q1;
  reg [1:0] tb_select;
  reg [7:0] tb_x,tb_y;
  wire [7:0] tb_z;
  mux_Q1 test(
    .select(tb_select), .x(tb_x), .y(tb_y), .z(tb_z)
  );
  initial begin
    $monitor("Time=%0t | Select=%d | x=%d | y=%d | z=%d", $time,tb_select,tb_x,tb_y,tb_z);
    tb_x=8'd6; tb_y=8'd8;
    tb_select=2'd0;
    #10; //z=0
    tb_select=2'd1;
    #10; //z=x+y
    tb_select=2'd2;
    #10; //z=x^y
    tb_x=8'd3; tb_y=8'd7;
    tb_select=2'd3;
    #10; //z=0
    tb_x=8'd4; tb_y=8'd5;
    tb_select=2'd3;
    #10; //z=1
    $finish;
  end
endmodule