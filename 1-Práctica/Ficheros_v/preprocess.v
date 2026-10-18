module preprocess(output wire [3:0] AMod, output wire [3:0] BMod, output wire add1, input wire [3:0] A, input wire [3:0] B, input wire [2:0] Op);
  wire op1_A, op2_B, cpl1;
  wire [3:0] conector;

  assign op1_A = Op[2] | Op[1];
  assign op2_B = Op[2] | Op[1];
  assign cpl1 = ~Op[2] & Op[0];
  assign add1 = Op[0];

  // Instancias
  mux2_4 muxA(AMod, 4'b0000, A, op1_A);
  mux2_4 muxB(conector, A, B, op2_B);
  compl1 complementador(BMod, conector, cpl1);

endmodule