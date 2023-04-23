module verilogtest(a, clk, r);

	input [1:0]a;
	input clk;
	output reg r;
	 
	 
	always @ (posedge clk) begin
	 
		case (a)
			
			0:
				r <= 0;
				
			1:
				r <= 1;
			
			2:
				r <= 0;
				
			3:
				r <= 1;
				
			default: r <= 1;
		endcase
	end
		
	 
endmodule 