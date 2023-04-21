// Multiplexador 2x1 de 4 bits

module mux2x1_4b (i0, i1, s0, f);
	input [3:0] i0, i1;
	input s0;
	output [3:0] f;

	
	assign f[0] = i0[0]&(~s0) | i1[0]&s0;
	assign f[1] = i0[1]&(~s0) | i1[1]&s0;
	assign f[2] = i0[2]&(~s0) | i1[2]&s0;
	assign f[3] = i0[3]&(~s0) | i1[3]&s0;
	
endmodule
