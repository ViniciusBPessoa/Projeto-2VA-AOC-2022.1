// Projeto 2 VA Arquitetura e Organização de Computadores - 2022.1
// Alunos: Vinícius Bezerra, Irlan Farias, Apolo Albuquerque, joão vitor castro
// Descrição do arquivo: Memória de instrução (i_mem)

module i_mem (
  input 		 [31:0] address,
  output reg [31:0] i_out
);

	reg [31:0] mem [0:1023];

	initial begin
	
		$readmemb("instruction.list", mem);
	end
	
	
	
	always @ (address) 
	begin
	
		i_out <= mem[address]; // Lê a instrução na posição indicada por address 
		
	end
	
endmodule 