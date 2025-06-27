module bcd_splitter(
  input wire clk2,
  input wire [4:0] input_val,
  output reg [3:0] BCD,
  output reg [3:0] sel_an
);

reg algo = 0;

always @(posedge clk2) begin
  case(algo)
  0: begin
    BCD <= input_val % 10;
    sel_an <= 4'b1110;
    algo <= 1;
  end
  1: begin
    BCD <= (input_val - (input_val % 10)) / 10;
    sel_an <= 4'b1101;
    algo <= 0;  // Para que alterne entre 0 y 1
  end
  endcase
end

endmodule