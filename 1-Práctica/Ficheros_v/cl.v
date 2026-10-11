// Módulo de celda lógica

module cl(output wire out, input wire a, b, input wire [1:0] S);

  // Declaracion de las señales de salida
  wire salida_and, salida_or, salida_xor, salida_not_a;

  // Instanciación de las compuertas lógicas
  and and1(salida_and, a, b);
  or or1(salida_or, a, b);
  xor xor1(salida_xor, a, b);
  not notA(salida_not_a, a);

  mux4_1 mux1(out, salida_not_a, salida_and, salida_or, salida_xor, S);

endmodule