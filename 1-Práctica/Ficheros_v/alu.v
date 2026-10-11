module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [2:0] Op);

  wire add1, c_out;
  wire [3:0] AMod, BMod, salida_ul4, salida_sum4;

  preprocess pre1(AMod, BMod, add1, A, B, Op);
  sum4 sum1(salida_sum4, c_out, AMod, BMod, add1);
  ul4 ul1(salida_ul4, AMod, BMod, Op[1:0]);
  mux2_4 mux1(R, salida_sum4, salida_ul4, Op[2]);
  flags flag1(carry, zero, sign, R, c_out);


endmodule