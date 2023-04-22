// Somador de 4 bits para entradas de 32 Bits

module somadorPC (nextPC, s);
	
	input [31:0] nextPC;
	output [31:0] s;
	
	
	
	assign s = nextPC + 32'b0100;


endmodule
