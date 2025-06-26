module bcd_splitter(
  input wire clk2,
  input wire [7:0] input_val,
  output reg [7:0] BCD
);

reg algo = 0;
always @(posedge clk2) begin
  case(algo)
  0: begin
    BCD <= input_val % 10;
    algo <=1;
  end
  1: begin
    BCD <=(input_val-(input_val%10))/10;
  end
  endcase
end
endmodule