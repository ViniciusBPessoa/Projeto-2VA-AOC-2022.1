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