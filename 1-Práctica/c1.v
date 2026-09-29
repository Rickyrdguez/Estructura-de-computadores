// Módulo de celda lógica

module cl(output wire out, input wire a, b, input wire [1:0] S);

  wire salida_and;
  and and1(salida_and, a, b);

  wire salida_or;
  or or1(salida_or, a, b);

  wire salida_xor;
  xor xor1(salida_xor, a, b);

  wire salida_not_a;
  not notA(salida_not_a, a);

  mux4_1 mux1(out, salida_not_a, salida_and, salida_or, salida_xor, S);

endmodule