`include "freq_div.v"
`include "bcd_splitter.v"
`include "BCDtoSSeg.v"
module top(
    input clk,
    input [4:0] input_val,
    output [6:0] SSeg,
    output [3:0] an
);

wire clk2;
wire [3:0] BCD;
wire [3:0] sel_an;

cf_divider divider_inst(
    .clk(clk),
    .fdiv(clk2)
);
bcd_splitter splitter_inst(
    .clk2(clk2),
    .input_val(input_val),
    .BCD(BCD),
    .sel_an(sel_an)
);

BCDtoSSeg display_inst(
    .BCD(BCD),
    .SSeg(SSeg),
    .an(an),
    .sel_an(sel_an)
);
endmodule
