module ALU (
    input  logic [3:0] opcode,
    input  logic [7:0] A,
    input  logic [7:0] B,
    output logic [7:0] result
);

    always_comb begin
        case (opcode)

            4'b0000: result = A + B;           // ADD
            4'b0001: result = A - B;           // SUB
            4'b0010: result = A << B;          // SHL
            4'b0011: result = A >> B;          // SHR
            4'b0100: result = A & B;           // AND
            4'b0101: result = A | B;           // OR
            4'b0110: result = A ^ B;           // XOR

            4'b0111: result = ~A;              // NOT
            4'b1000: result = A + 8'd1;        // INC
            4'b1001: result = A - 8'd1;        // DEC

            default: result = 8'd0;
        endcase
    end

endmodule