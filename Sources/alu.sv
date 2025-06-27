module alu(a, b, s, f, ovf, take_branch);
  input logic [15:0] a, b;
  input logic [3:0] s;
  output logic [15:0] f;
  output logic ovf;
  output logic take_branch;

  always_comb begin
    case (s)
      4'b0000: begin
        f = a+b; ovf = (a[15] & b[15] & ~f[15]) | (~a[15] & ~b[15] & f[15]); take_branch =0 ;
      end
      4'b0001: begin
      	f = ~b; ovf =0 ; take_branch =0 ;
      end
      4'b0010: begin
      	f = a&b; ovf =0 ; take_branch =0 ;
      end
      4'b0011: begin
      	f = a|b; ovf =0 ; take_branch =0 ;
      end
      4'b0100: begin
      	f = a>>>b; ovf =0 ; take_branch =0 ;
      end
      4'b0101: begin
      	f = a<<b; ovf =0 ; take_branch =0 ;
      end
      4'b0110: begin
      	f = 0; ovf =0 ; take_branch = a==0?1:0;
      end
      4'b0111: begin
      	f = 0; ovf =0 ; take_branch = a==0?0:1;
      end
      4'b1000: begin
      	f = a^b; ovf =0 ; take_branch = 0;
      end
      default: begin
      	f = 0; ovf = 0; take_branch = 0;
      end
    endcase
  end
endmodule
