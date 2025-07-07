module bcd_splitter(
  input wire clk2,
  input wire [4:0] input_val,
  output reg [3:0] BCD,
  input wire selector,
  output reg [3:0] sel_an
);

reg algo = 0;

wire [4:0] input_val_final;

assign input_val_final = (selector)? {1'b0, input_val[3:0]} : input_val;


always @(posedge clk2) begin
  case(algo)
  0: begin
    BCD <= input_val_final % 10;
    sel_an <= 4'b1110;
    algo <= 1;
  end
  1: begin
    BCD <= (input_val_final - (input_val_final % 10)) / 10;
    sel_an <= 4'b1101;
    algo <= (selector & ~input_val[4])? 2: 0;  // Para que alterne entre 0 y 1
  end
  2: begin
    BCD <= 4'ha;
    sel_an <= 4'b1011;
    algo <= 0;
  end
  endcase
end

endmodule