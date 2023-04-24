module extensor_de_sinal(entrada, saida);
								  
	// Declara entrada e saída
	input wire [15:0] entrada;
	output reg [31:0] saida;

	always @(entrada) begin							// Sensível a mudança em 'entrada'
		saida = {{16{entrada[15]}}, entrada};		// Faz a extensão de bits
	end

endmodule
