module REGISTERS_16x8b (
    input  logic       clk,
    input  logic       reset,

    input  logic       we,
    input  logic [3:0] addr_write,
    input  logic [7:0] data_write,

    input  logic [3:0] addr_read,
    output logic [7:0] data_read
);

    logic [7:0] regs [0:15];
    
    assign data_read = regs[addr_read];

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            regs[0]  <= 8'd0;
            regs[1]  <= 8'd0;
            regs[2]  <= 8'd0;
            regs[3]  <= 8'd0;
            regs[4]  <= 8'd0;
            regs[5]  <= 8'd0;
            regs[6]  <= 8'd0;
            regs[7]  <= 8'd0;
            regs[8]  <= 8'd0;
            regs[9]  <= 8'd0;
            regs[10] <= 8'd0;
            regs[11] <= 8'd0;
            regs[12] <= 8'd0;
            regs[13] <= 8'd0;
            regs[14] <= 8'd0;
            regs[15] <= 8'd0;
        end else begin
            if (we) begin
                regs[addr_write] <= data_write;
            end
        end
    end

endmodule