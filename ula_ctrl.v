module ula_ctrl(
    input wire [5:0] funct,
    input wire [2:0] ALUOp,
    output reg [3:0] ALUControl
);

always @(*) begin
    case (ALUOp)
        3'b000: ALUControl = 4'b0010; // operação de add
        3'b001: ALUControl = 4'b0110; // operação de sub
        3'b010: 
            case (funct)
                6'b100000: ALUControl = 4'b0010; // operação de add
                6'b100010: ALUControl = 4'b0110; // operação de sub
		6'b100100: ALUControl = 4'b0000; // operação de and
                6'b100101: ALUControl = 4'b0001; // operação de or
                6'b101010: ALUControl = 4'b0111; // operação de set on less than
                default: ALUControl = 4'bxxxx; // don't care para instrução inválida
            endcase
        3'b011: ALUControl = 4'b0000; // operação de and
        3'b100: ALUControl = 4'b0001; // operação de or
        3'b101: ALUControl = 4'b0111; // operação de set on less than
        default: ALUControl = 4'bxxxx; // don't care para instrução inválida
    endcase
end

endmodule
