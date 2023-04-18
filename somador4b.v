module somador4b(a, b, cin, s, cout); // um somador de 4 bits

	input [3:0] a,b; // a, b são são os valores a serem somados 
	input cin; // cin é o valor que vem do somador anterior caso a soma tenha estourado 
	output [3:0]s; // s é o reultado da soma
	output cout; // count é a entrada do valor estourado da operação anterior
	
	wire f1, f2, f3;  // são os fios que serão utilizados para ligar cada somador no próximo
	
	// cada um das linhas a seguir são somadores de 1 bit cada um ligado no anterior já que precisamos saber se o valor estourou ou seja s = 2
	//  cada um dos s são atribuídos a 1 bit de s saída

	somador_completo s1(.a(a[0]), .b(b[0]), .cin(cin), .s(s[3]), .cout(f1)); 
	somador_completo s2(.a(a[1]), .b(b[1]), .cin(f1), .s(s[2]), .cout(f2));
	somador_completo s3(.a(a[2]), .b(b[2]), .cin(f2), .s(s[1]), .cout(f3));
	somador_completo s4(.a(a[3]), .b(b[3]), .cin(f3), .s(s[0]), .cout(cout));
	

endmodule // fim do modulo