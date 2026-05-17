module PC(
    input  logic       clk,
    input  logic       reset,
    input  logic       inc,
    input  logic       load,
    input  logic [7:0] data_in,
    output logic [7:0] pc_out
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            pc_out <= 8'd0;
        end else begin
            if (load) begin
                pc_out <= data_in;
            end else if (inc) begin
                pc_out <= pc_out + 8'd1;
            end
        end
    end

endmodule