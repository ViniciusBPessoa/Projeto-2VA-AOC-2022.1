// Somador Completo

module somador (a, b, cin, s, cout);

	//entradas e saídas
	input a, b, cin;
	output s, cout;
	
	//fios
	wire w1, w2, w3;
	
	//lógica do circuito
	xor u0 (w1, a, b);
	xor u1 (s, w1, cin);
	and u2 (w2, cin, w1);
	and u3 (w3, a, b);
	or u4 (cout, w2, w3);
	
	

endmodule