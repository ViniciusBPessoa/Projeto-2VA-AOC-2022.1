//Multiplexador 4 para 1
module mux4x1 (i0, i1, i2, i3, s1, s0, f);
	input i0, i1, i2, i3, s1, s0;
	output f;
	
	//Funcionamento do circuito com expressão lógica
	/*
	
	00 = i0
	01 = i1
	10 = i2
	11 = i3
	
	*/
	assign f = i0&(~s1)&(~s0) | i1&(~s1)&s0 | i2&s1&(~s0) | i3&s1&s0;

endmodule
