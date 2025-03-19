module counter_Q4(input en,hold,rstn,clk,up_down, output reg [7:0] cntr);
  always @(posedge clk or negedge rstn) begin
    if(!rstn)
      cntr<=8'b0;
    else if(en) begin
      if(!hold) begin
          if(up_down)
            cntr<=cntr+1;
          else
            cntr<=cntr-1;
        end
    end
    else
      cntr<=8'b0;
  end
endmodule