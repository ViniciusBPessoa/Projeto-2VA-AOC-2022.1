module i_mem (
  input 		 [31:0] address 						// Declara entrada que vem de PC
  output reg [31:0] i_out 								// Declara saída
);

	reg [31:0] mem [0:1023];							// Declara um array de registradores com 1024 elementos, onde cada elemento é um registrador de 32 bits

	initial begin
		$readmemb("instruction.list", mem); 			// Lê o arquivo passado com todas as instruções e guarda em 'mem'
	end
	
	always @ (address) 									// Sensível a mudança em 'address'
	begin
		i_out <= mem[address]; 							// Lê a instrução na posição indicada por address //
	end
	
endmodule 