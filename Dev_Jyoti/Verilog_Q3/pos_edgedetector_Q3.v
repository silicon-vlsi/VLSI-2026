module pos_edgedetector_Q3(input clk, rstn, a, output reg b);
  reg a_prev;//stores the previous state of a
  always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
      a_prev<=0;
      b<=0;
    end else begin
      b<=(~a_prev & a);
      a_prev<=a;
    end
  end
endmodule