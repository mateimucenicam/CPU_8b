module STACK_64x8b (
    input  logic       clk,
    input  logic       reset,

    input  logic       push,
    input  logic       pop,
    input  logic [7:0] data_in,

    output logic [7:0] top
);

    logic [7:0] mem [0:63];
    logic [5:0] sp;

    assign top = mem[sp - 6'd1];

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sp <= 6'd0;
        end else begin
            if (push) begin
                mem[sp] <= data_in;
                sp <= sp + 6'd1;
            end else if (pop) begin
                sp <= sp - 6'd1;
            end
        end
    end

endmodule