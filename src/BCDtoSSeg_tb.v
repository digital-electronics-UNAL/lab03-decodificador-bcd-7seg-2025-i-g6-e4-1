`timescale 1ps/1ps
`include "src/BCDtoSSeg_mod.v"

module BCDtoSSeg_tb();

reg [4:0] input_val;
reg clk2;

wire [3:0] BCD;

bcd_splitter uut(
    .clk2(clk2),
    .input_val(input_val),
    .BCD(BCD)
);

always #5 clk2=~clk2;

initial begin
    clk2=1'b0;
    input_val=5'b10101;
end

initial begin
    $dumpfile("BCD.vcd");
    $dumpvars(-1, uut);
    #100 $finish;
end
endmodule