// Contador de prograga - PC

module PC (clk, nextPC, PC);

	input wire clk;
	input wire [31:0] nextPC;
	output reg [31:0] PC;
	
	

	always @(posedge clk) begin
		PC <= nextPC;
	end

endmodule


