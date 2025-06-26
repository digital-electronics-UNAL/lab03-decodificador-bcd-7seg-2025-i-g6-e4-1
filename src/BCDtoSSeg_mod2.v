module bcd_splitter(
    input wire clk2,
    input wire [7:0] input_val,
    output reg [7:0] BCD,
    output reg [7:0] counter 
);

reg algo = 0;

always @(posedge clk2) begin
    case(algo)
        0: begin  
            if (counter == 25) begin
                counter <= 0;
                BCD <= input_val; 
            end
            else begin
                counter <= counter + 1;
            end
        end
        default: algo <= 0;
    endcase
end

endmodule