`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 08:30:44 AM
// Design Name: 
// Module Name: instruction_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module instruction_decoder(
    input logic [3:0] opcode, 
    input logic [5:0] nzimm,
    input logic [8:0] offset,
    input logic [6:0] immediate,
    output logic RegWrite, RegDst, ALUSrc1, ALUSrc2, MemWrite, MemToReg, Regsrc,
    output logic [15:0] alu_input2_instr_src,
    output logic [3:0] ALUOp
);

    always_comb begin
        // Default values to avoid latches
        RegWrite = 0;
        RegDst = 0;
        ALUSrc1 = 0;
        ALUSrc2 = 0;
        MemWrite = 0;
        MemToReg = 0;
        Regsrc = 0;
        alu_input2_instr_src = 16'b0;
        ALUOp = 4'b0000;

        case (opcode)
            4'b0000: begin // lw
                RegWrite = 1;
                RegDst = 1;
                alu_input2_instr_src = immediate;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0000;
                MemWrite = 0;
                MemToReg = 1;
                Regsrc = 0;
            end
            4'b0001: begin // sw
                RegWrite = 0;
                alu_input2_instr_src = immediate;
                ALUSrc1 = 1;
                ALUSrc2 = 1;
                ALUOp = 4'b0000;
                MemWrite = 1;
            end
            4'b0010: begin // add
                RegWrite = 1;
                RegDst = 1;
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b0000;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0011: begin // addi
                RegWrite = 1;
                RegDst = 1;
                alu_input2_instr_src = immediate;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0000;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0100: begin // and
                RegWrite = 1;
                RegDst = 1;
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b0010;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0101: begin // andi
                RegWrite = 1;
                RegDst = 1;
                alu_input2_instr_src = immediate;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0010;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0110: begin // or
                RegWrite = 1;
                RegDst = 1;
                alu_input2_instr_src = immediate;
                ALUSrc1 = 1;
                ALUSrc2 = 0;
                ALUOp = 4'b0011;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0111: begin // xor
                RegWrite = 1;
                RegDst = 1;
                alu_input2_instr_src = immediate;
                ALUSrc1 = 1;
                ALUSrc2 = 0;
                ALUOp = 4'b1000;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b1000: begin // srai
                RegWrite = 1;
                RegDst = 1;
                alu_input2_instr_src = nzimm;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0100;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b1001: begin // slli
                RegWrite = 1;
                RegDst = 1;
                alu_input2_instr_src = nzimm;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0101;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b1010: begin // beqz
                RegWrite = 0;
                alu_input2_instr_src = offset;
                ALUSrc1 = 1;
                ALUSrc2 = 0;
                ALUOp = 4'b0110;
            end
            4'b1011: begin // bneqz
                RegWrite = 0;
                alu_input2_instr_src = offset;
                ALUSrc1 = 1;
                ALUSrc2 = 0;
                ALUOp = 4'b0111;
            end
        endcase
    end
endmodule

