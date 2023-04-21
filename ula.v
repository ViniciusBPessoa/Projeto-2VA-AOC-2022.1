// Unidade lógico aritmetica

module ula (a, b, x, y, z, s);
	input [3:0] a, b;
	input x, y, z;
	output [3:0] s;
	
	//Lógica da ULA
	
	wire [3:0] w0, w1, w2, w3, w4, w5, w6, w7;
	
	assign w0 = a + b;
	assign w1 = a - b;
	assign w2 = a << b;
	assign w3 = a >> b;
	assign w4 = a & b;
	assign w5 = a | b;
	assign w6 = a ^ b;
	assign w7 = ~a;
	
	mux8x1_4b muxout (.i0(w0), .i1(w1), .i2(w2), .i3(w3), .i4(w4), .i5(w5), .i6(w6), .i7(w7), .s2(x), .s1(y), .s0(z), .f(s));


endmodule
