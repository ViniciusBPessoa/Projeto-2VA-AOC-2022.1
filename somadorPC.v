// Projeto 2 VA Arquitetura e Organização de Computadores - 2022.1
<<<<<<< Updated upstream
// Alunos: Vinícius Bezerra, Irlan Farias, Apolo Albuquerque, João Vitor Castro
// Descrição do arquivo: Soma 4 bits ao endereço de entrada e retorna (SomadorPC)
=======
// Alunos: Vinícius Bezerra, Irlan Farias, Apolo Albuquerque, joão vitor castro
// Descrição do arquivo: Somador de 4 bits para entradas de 32 Bits
>>>>>>> Stashed changes

module somadorPC (nextPC, soma);
	
	input [31:0] nextPC; // Endereço de entrada
	output [31:0] soma; // Endereço de saída
	
<<<<<<< Updated upstream
	assign soma = nextPC + 32'b0100; // Soma 4 bits ao endereço e retorna
=======
	assign soma = nextPC + 32'b0100;
>>>>>>> Stashed changes

endmodule
