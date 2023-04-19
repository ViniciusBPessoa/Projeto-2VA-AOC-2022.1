// Multiplexador 2 para 1

module mux2x1 (i0, i1, s0, f);
	input i0, i1, s0;
	output f;
	
	//Funcionamento do circuito com expressão lógica
	/*
	
s ->	0 = i0
s ->	1 = i1
	
	*/
	assign f = i0&(~s0) | i1&s0;

endmodule
