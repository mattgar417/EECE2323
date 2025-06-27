module program_counter(input clk, input rst, input [8:0] offset, input take_branch, output reg [8:0] pc);
    always @(posedge clk)
            pc <= ( rst ? 0 : (pc + ( take_branch ? offset : 1 )));
endmodule