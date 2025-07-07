`timescale 1ps/1ps
`include "src/freq_div.v"
`include "src/BCDtoSSeg_mod.v"
`include "src/sum4b_estruc.v"

module Divisor_freq_tb();

reg [4:0] input_val;
reg clk;

wire [0:6] Sseg;
wire [3:0] an;

cf_divider uut (
    .clk(clk), .input_val(input_val), .SSeg(SSeg), .an(an)
);

always #5 clk=~clk;

initial begin
    clk=1'b0;
    input_val=5'b10101;
end

initial begin
    $dumpfile("Divisor_freq_tb.vcd");
    $dumpvars(-1, uut);
    #90000000 $finish;
end

endmodule