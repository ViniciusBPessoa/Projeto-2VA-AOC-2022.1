module extensor_de_sinal(entrada, saida);
								  
	input wire [15:0] entrada;
	output reg [31:0] saida;

	always @(entrada) begin
		saida = {{16{entrada[15]}}, entrada};
	end

endmodule
