// Testbench para modulo preprocess

`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulacion y el paso de simulacion

module preprocess_tb;
//declaracion de señales

reg [3:0] A, B; //las señales de datos de entrada al mux. Se han declarado reg porque queremos inicializarlas
reg [2:0] Op;    //selector de 2 bits. Tambien reg, y el rango [1:0] va justo detras de reg
wire [3:0] AMod, BMod;       //señal de salida, se declara como wire porque su valor lo fija el mux
wire add1;

//instancia del modulo a testear, con notacion de posiciones de argumentos (solo nombres, en el orden del prototipo)
  preprocess pre1(AMod, BMod, add1, A, B, Op);   // orden del prototipo

//Lo siguiente comentado es una notacion alternativa para instanciar el modulo, los parametros se denotan con un punto seguido del
//nombre del parametro en la definicion original del modulo y entre parentesis a que se conecta en el modulo actual
//no importa el orden de los parametros definidos asi ->
//mux4_1 mux1(.out(out), .a(a), .b(b), .c(c), .d(d), .S(S));


initial
begin
  $monitor("tiempo=%0d Op=%b A=%b B=%b AMod=%b BMod=%b add1=%b", $time, Op, A, B, AMod, BMod, add1);
  $dumpfile("preprocess_tb.vcd");
  $dumpvars;

  A = 4'b0011;
  B = 4'b0101;

  Op = 3'b000; #20;   // A
  Op = 3'b001; #20;   // -A
  Op = 3'b010; #20;   // A+B
  Op = 3'b011; #20;   // A-B
  Op = 3'b100; #20;   // inv(A)
  Op = 3'b101; #20;   // A and B
  Op = 3'b110; #20;   // A or B
  Op = 3'b111; #20;   // A xor B

  $finish;  //fin simulacion

end
endmodule
