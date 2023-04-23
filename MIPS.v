module MIPS (input clock);
	
	wire [31:0] con_PC_i_men;
	wire [31:0] con_i_men_reg;
	
	PC pc_inst (.clock(clock), .nextPC(mux_PC_soma), .PC(con_PC_i_men)); // instancia de pc
	i_mem mem_inst (.address(con_PC_i_men), .i_out(con_i_men_reg)); // instancia de I-MEM
	
	// conjunto de cabos que comunicam ao processador as diferentes partes da instrução
	wire [5:0] op; 
	wire [4:0] rs, rt, rd;
	
	// conjunto de cabos que ligam o processador a unidade de controle
	wire RegDst;
	wire Br;
	wire ALUSrc;
	wire MemWrite;
	wire MemRead;
	wire MentoReg1;
	
	// cabos vinculados ao pc como somador por ex
	wire [31:0] soma_somador4;
	wire [31:0] extendido;
	wire [31:0] saida_somador_jumpr;
	wire [31:0] shift_2;
	
	// separador da instrução
	assign op = con_i_men_reg[31:26];
	assign rs = con_i_men_reg[25:21];
	assign rt = con_i_men_reg[20:16];
	assign est = con_i_men_reg[15:0];
	
	// cabos vinculados a memoria
	wire [31:0] soma_ou_memoria;
	wire [31:0] saida_2_reg;
	wire [31:0] saida_d_men;
	wire [31:0] soma_lw;
	
	 // instancia da unidade de controle
	
	assign rd = RegDst ? con_i_men_reg[15:11] : con_i_men_reg[20:16]; // mux que define se a se o dado vai ser gravado e onde
	
	somadorPC soma_1 (.nextPC(con_PC_i_men), .soma(soma_somador4)); // somador do pc
	
	assign mux_PC_soma = Br ? saida_somador_jumpr : soma_somador4; // multiplexador que vai selecionar se a função é do tipo branche 
	
	extensor_de_sinal ex_si (.entrada(est), .saida(extendido)); // sinal extendido para pc ainda vai passar por multiplexador
	
	assign shift_2 = extendido << 2;
	
	somador_jump somador_pc (.soma_pc(soma_somador4), .ex_pc(shift_2), .po_jp(saida_somador_jumpr));
	
	control unidade_de_controle (.opcode(op), .RegDst(RegDst), .Branch(Br), .ALUSrc(ALUSrc), .MemWrite(MemWrite), .MemRead(MemRead), .MentoReg(MentoReg1));
	
	regfile reg_inst (   // declaração do regfile
  .ReadAddr1(rs),
  .ReadAddr2(rt),
  .ReadData1(ReadData1),
  .ReadData2(saida_2_reg),
  .Clock(clock),
  .WriteAddr(rd),
  .WriteData(soma_lw),
  .RegWrite(RegWrite),
  .Reset(Reset));
  
	d_mem(.Address(Address), .WriteData(saida_2_reg), .ReadData(saida_d_men), .MemWrite(MemRead), .MemRead(MemRead));
  
	assign soma_ou_memoria = ALUSrc ? extendido : saida_2_reg; // falta por para a ula
	
	assign soma_lw = MentoReg1 ? saida_d_men : soma_somador4;
  
endmodule 