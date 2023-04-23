module PC (clock, nextPC, PC);

	input wire clock;
	input wire [31:0] nextPC;
	output reg [31:0] PC;

	always @(posedge clock) begin
		 PC <= nextPC;
	end

endmodule 