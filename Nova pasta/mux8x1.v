//Multiplexador 8 para 1

module mux8x1(i0, i1, i2, i3, i4, i5, i6, i7, s0, s1, s2, f);
	input i0, i1, i2, i3, i4, i5, i6, i7, s0, s1, s2;
	output f;
	
	wire c0, c1, c2, c3;
	assign c0 = s0, c1 = s1;
	
		mux4x1 fa0 (.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s1(c1), .s0(c0), .f(c2));
		mux4x1 fa1 (.i0(i4), .i1(i5), .i2(i6), .i3(i7), .s1(c1), .s0(c0), .f(c3));
		mux2x1 fa2 (.i0(c2), .i1(c3), .s0(s2), .f(f));
	

endmodule
