module cf_divider (clk, fdiv);

input clk;
output reg fdiv;

reg [$clog2 (800000)-1:0] counter;

always @(posedge clk) begin
    if (counter == 800000) begin
        counter <= 'd0;
        fdiv <= ~fdiv;
    end else begin
        counter <= counter+1;
    end
end
endmodule