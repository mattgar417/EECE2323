module TwoToOneMux(
    input logic [15:0] a,    // 16-bit Input 0
    input logic [15:0] b,    // 16-bit Input 1
    input logic sel_mux,     // 1-bit Select line
    output logic [15:0] out  // 16-bit Output
);

    assign out = sel_mux ? b : a;

endmodule
