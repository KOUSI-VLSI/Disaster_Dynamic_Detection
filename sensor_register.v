module sensor_register (
    input        clk,
    input        reset,
    input        sample_valid,
    input  [7:0]  sensor_in,
    output reg [7:0] sensor_out
);

always @(posedge clk or posedge reset)
 begin

    if (reset)
        sensor_out <= 8'd0;

    else if (sample_valid)
        sensor_out <= sensor_in;

end

endmodule