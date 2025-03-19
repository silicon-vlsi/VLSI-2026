module mux_Q1 (input [1:0] select, input [7:0] x,y, output reg [7:0] z);
  always @(*) begin
    case(select)
      2'd0: z=8'd0;
      2'd1: z=x+y;
      2'd2: z=x^y;
      2'd3: z=((x[0]&y[0])==1) ? 8'd0 : 8'd1;
      default: z=8'd0;
    endcase
  end
endmodule