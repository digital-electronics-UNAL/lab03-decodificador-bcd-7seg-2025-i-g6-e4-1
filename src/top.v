module top(
    input clk,
    input [3:0] A,
    input [3:0] B,
    input selector,
    output [6:0] SSeg,
    output [3:0] an
);

wire clk2;

cf_divider divider_inst(
    .clk(clk),
    .fdiv(clk2)
);
bcd_splitter splitter_inst(
    .clk2(clk2),
    .input_val({Cout, S}),
    .BCD(BCD),
    .sel_an(sel_an),
    .selector(selector)
);

wire Cout;
wire [3:0] S;

BCDtoSSeg display_inst(
    .BCD(BCD),
    .SSeg(SSeg),
    .an(an),
    .sel_an(sel_an)
);

sum4b_estruc inst(
    .A(A),
    .B(B),
    .Ci(selector),
    .Cout(Cout),
    .S(S)
);
endmodule
