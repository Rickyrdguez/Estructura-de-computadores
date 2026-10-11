
module flags(output wire carry, zero, sign, input wire [3:0] R, input wire c_out);

  assign carry = c_out;
  assign sign = R[3];
  assign zero = (R == 4'b0000) ? 1 : 0;

endmodule