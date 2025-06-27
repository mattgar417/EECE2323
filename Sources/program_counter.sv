module program_counter(clk, rst, pc);

    input logic clk;
    input logic rst;

    output logic [7:0] pc;

    //reg [7:0] pc;

    always_ff @(posedge clk or posedge rst)
    begin
        if (rst)
            pc <= 8'h00;
        else
            pc <= pc + 8'h04;
    end

endmodule
