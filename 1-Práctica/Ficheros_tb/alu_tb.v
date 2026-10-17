// Testbench para modulo alu
`timescale 1 ns / 10 ps

module alu_tb;
  reg [3:0] A, B;
  reg [2:0] Op;
  wire [3:0] R;
  wire zero, carry, sign;

  alu alu1(R, zero, carry, sign, A, B, Op);

  initial
  begin
    $monitor("tiempo=%0d Op=%b A=%b B=%b R=%b zero=%b carry=%b sign=%b", $time, Op, A, B, R, zero, carry, sign);
    $dumpfile("alu_tb.vcd");
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
    // Demostrar que 
    A = 4'b0101; B = 4'b0101; Op = 3'b011; #20;   // A-B  -> R=0000, zero=1, carry=1
    A = 4'b1111; B = 4'b0010; Op = 3'b010; #20;   // A+B  -> carry=1, zero=0

    $finish;
  end
endmodule