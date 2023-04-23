module somador_jump (soma_pc, ex_pc, po_jp);
	
	input wire [31:0] soma_pc, ex_pc;
	output wire [31:0] po_jp;

	// Somador de 32 bits com entrada soma_pc e ex_pc, e saída po_jp
	assign po_jp = soma_pc + ex_pc;
	
endmodule  
