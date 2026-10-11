// Testbench para modulo mux4_1

`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulacion y el paso de simulacion

module cl_tb;
//declaracion de señales

reg a, b; //las señales de datos de entrada al mux. Se han declarado reg porque queremos inicializarlas
reg [1:0] S;    //selector de 2 bits. Tambien reg, y el rango [1:0] va justo detras de reg
wire out;       //señal de salida, se declara como wire porque su valor lo fija el mux

//instancia del modulo a testear, con notacion de posiciones de argumentos (solo nombres, en el orden del prototipo)
cl c1(out, a, b, S);

//Lo siguiente comentado es una notacion alternativa para instanciar el modulo, los parametros se denotan con un punto seguido del
//nombre del parametro en la definicion original del modulo y entre parentesis a que se conecta en el modulo actual
//no importa el orden de los parametros definidos asi ->
//mux4_1 mux1(.out(out), .a(a), .b(b), .c(c), .d(d), .S(S));


initial
begin
  $monitor("tiempo=%0d a=%b b=%b S=%b out=%b", $time, a, b, S, out);
  $dumpfile("cl_tb.vcd");
  $dumpvars;

  //vector de test 0: deberia salir a
  a = 1'b0;
  b = 1'b0;
  S = 2'b00;
  #20;

  //vector de test 1: deberia salir b
  a = 1'b0;
  b = 1'b1;
  S = 2'b01;
  #20;

  //vector de test 2: deberia salir c
  a = 1'b1;
  b = 1'b0;
  S = 2'b10;
  #20;

  a = 1'b1;
  b = 1'b1;
  S = 2'b11;
  #20;


  $finish;  //fin simulacion

end
endmodule
