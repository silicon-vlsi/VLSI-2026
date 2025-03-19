module sequential_Q2(input clk,a,rstn, output reg b,c);
  always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
      b<=0;
      c<=0;
    end else begin
      b<=a;
      c<=b;
    end
  end
endmodule