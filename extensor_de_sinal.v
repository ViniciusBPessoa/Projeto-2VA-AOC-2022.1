// Projeto 2 VA Arquitetura e Organização de Computadores - 2022.1
// Alunos: Vinícius Bezerra, Irlan Farias, Apolo Albuquerque, joão vitor castro
// Descrição do arquivo: Extensor de sinal de 16b para 32b

module extensor_de_sinal(entrada, saida);
								  
	input wire [15:0] entrada;
	output reg [31:0] saida;

	always @(entrada) begin
		saida = {{16{entrada[15]}}, entrada};
	end

endmodule
