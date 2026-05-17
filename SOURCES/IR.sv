module IR(
    input  logic       clk,
    input  logic       reset,
    input  logic       load,
    input  logic [7:0] data_in,
    output logic [7:0] ir_out
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            ir_out <= 8'd0;
        end else begin
            if (load) begin
                ir_out <= data_in;
            end
        end
    end

endmodule