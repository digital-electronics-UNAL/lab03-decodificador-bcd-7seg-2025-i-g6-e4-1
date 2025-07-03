`timescale 1ps/1ps
`include "freq_div.v"

module Divisor_freq_tb();

reg [4:0] input_val;
reg clk;

wire [0:6] Sseg;
wire [3:0] an;

Divisor uut (
    .clk(clk), .input_val(input_val), SSeg(SSeg), .an(an)
);

always #5 clk=~clk;

initial begin
    clk=1'b0;
    input_val=5'b10101;
end

initial begin
    $dumpfile("Divisor.vcd");
    $dumpvars(-1, uut);
    #90000000 #finish;
end

endmodule