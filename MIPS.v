module MIPS (clock, reset, PCs, ULSs, d_mens);

	input wire clock;
	input wire reset;
	output wire [31:0] PCs;
	output wire [31:0] ULSs;
	output wire [31:0] d_mens;
	
	wire [31:0] con_PC_i_men;
	wire [31:0] con_i_men_reg;
	
	PC pc_inst (.clock(clock), .nextPC(mux_PC_soma), .PC(con_PC_i_men)); // instancia de pc
	i_mem mem_inst (.address(con_PC_i_men), .i_out(con_i_men_reg)); // instancia de I-MEM
	
	assign PCs = con_PC_i_men;
	assign ULSs = result;
	assign d_mens = saida_d_men;
	
	// conjunto de cabos que comunicam ao processador as diferentes partes da instrução
	wire [5:0] op, inst; 
	wire [4:0] rs, rt, rd;
	
	// conjunto de cabos que ligam o processador a unidade de controle
	wire RegDst;
	wire Br;
	wire ALUSrc;
	wire MemWrite;
	wire MemRead;
	wire MentoReg;
	wire RegWrite;
	wire [3:0] ALUOp;
	
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
	assign inst = con_i_men_reg[5:0];
	
	// cabos vinculados a memoria
	wire [31:0] soma_ou_memoria;
	wire [31:0] saida_1_reg;
	wire [31:0] saida_2_reg;
	wire [31:0] saida_d_men;
	wire [31:0] soma_lw;
	
	// cabos vinculados a alu
	wire [3:0] ctl_ula_ula;
	wire zero_flag;
	wire [31:0] result;
	wire cabo_and;
	
	// instancia da unidade de controle
	d_mem (.Address(result), .WriteData(saida_2_reg), .ReadData(saida_d_men), .MemWrite(MemWrite), .MemRead(MemRead));
	
	control unidade_de_controle (.opcode(op), .RegDst(RegDst), .Branch(Br), .ALUSrc(ALUSrc), .MemWrite(MemWrite), 
	.MemRead(MemRead), .MentoReg(MentoReg), .ALUOp(ALUOp), .RegWrite(RegWrite));
	
	somador_jump somador_jp (.soma_pc(soma_somador4), .ex_pc(shift_2), .po_jp(saida_somador_jumpr));
	
	ula_ctrl (.funct(inst), .ALUOp(ALUOp), .ALUControl(ctl_ula_ula));
	
	ula ula (.In1(saida_1_reg), .In2(soma_ou_memoria), .OP(ctl_ula_ula), .Zero_flag(zero_flag), .result(result));
	
	extensor_de_sinal ex_si (.entrada(est), .saida(extendido)); // sinal extendido para pc ainda vai passar por multiplexador
	
	somadorPC soma_1 (.nextPC(con_PC_i_men), .soma(soma_somador4)); // somador do pc
	
	regfile reg_inst (   // declaração do regfile
  .ReadAddr1(rs),
  .ReadAddr2(rt),
  .ReadData1(saida_1_reg),
  .ReadData2(saida_2_reg),
  .Clock(clock),
  .WriteAddr(rd),
  .WriteData(soma_lw),
  .RegWrite(RegWrite),
  .Reset(reset));
	
	assign rd = RegDst ? con_i_men_reg[15:11] : con_i_men_reg[20:16]; // mux que define se a se o dado vai ser gravado e onde
	
	assign cabo_and = Br & zero_flag;
	
	assign mux_PC_soma = cabo_and ? saida_somador_jumpr : soma_somador4; // multiplexador que vai selecionar se a função é do tipo branche 
	
	assign shift_2 = extendido << 2;
	
	assign soma_ou_memoria = ALUSrc ? extendido : saida_2_reg; // falta por para a ula
	
	assign soma_lw = MentoReg ? saida_d_men : result;

	
	

  
endmodule 
