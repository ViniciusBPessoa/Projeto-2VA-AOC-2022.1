module PC (clk, rst, count);

    input clk, rst;
    output reg [7:0] count;

   always @(posedge clk or posedge rst)
   begin
      if (rst)
         count <= 8'b00000000;
      else
         count <= count + 1;
   end

endmodule 
