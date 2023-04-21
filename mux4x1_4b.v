//Multiplexador 4 para 1 de 4 bits

module mux4x1_4b(i0, i1, i2, i3, s0, s1, f);
	input [3:0] i0, i1, i2, i3;
	input s0, s1;
	output [3:0] f;
	
	
	assign f[3] = ~s1&(~s0)&i0[3] | ~s1&s0&i1[3] | s1&(~s0)&i2[3] | s1&s0&i3[3];
	assign f[2] = ~s1&(~s0)&i0[2] | ~s1&s0&i1[2] | s1&(~s0)&i2[2] | s1&s0&i3[2];
	assign f[1] = ~s1&(~s0)&i0[1] | ~s1&s0&i1[1] | s1&(~s0)&i2[1] | s1&s0&i3[1];
	assign f[0] = ~s1&(~s0)&i0[0] | ~s1&s0&i1[0] | s1&(~s0)&i2[0] | s1&s0&i3[0];
	

endmodule
