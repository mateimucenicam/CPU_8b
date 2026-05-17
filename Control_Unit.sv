module CONTROL_UNIT (
    input  logic       clk,
    input  logic       reset,

    input  logic [7:0] ir,

    output logic       pc_inc,
    output logic       pc_load,
    output logic       ir_load,

    output logic       reg_we,
    output logic       stack_push,
    output logic       stack_pop,

    output logic [1:0] stack_data_sel,
    output logic       reg_data_sel,
    output logic       pc_data_sel
);

    // state encoding
    logic state, next_state;

    localparam FETCH   = 1'b0;
    localparam EXECUTE = 1'b1;

    // state register
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= FETCH;
        else
            state <= next_state;
    end

    // next state logic
    always_comb begin
        case (state)
            FETCH:   next_state = EXECUTE;
            EXECUTE: next_state = FETCH;
            default: next_state = FETCH;
        endcase
    end

    logic [3:0] opcode;
    assign opcode = ir[7:4];

    // control logic
    always_comb begin

        // default
        pc_inc         = 0;
        pc_load        = 0;
        ir_load        = 0;

        reg_we         = 0;
        stack_push     = 0;
        stack_pop      = 0;

        stack_data_sel = 2'd0;
        reg_data_sel   = 2'd0;
        pc_data_sel    = 1'b0;

        case (state)

            FETCH: begin
                ir_load = 1;
                pc_inc  = 1;
            end

            EXECUTE: begin

                case (opcode)

                    // ALU + stack
                    4'b0000,
                    4'b0001,
                    4'b0010,
                    4'b0011,
                    4'b0100,
                    4'b0101,
                    4'b0110:
                    begin
                        reg_we       = 1;
                        reg_data_sel = 0;
                        stack_pop    = 1;
                    end

                    // ALU fără stack
                    4'b0111,
                    4'b1000,
                    4'b1001:
                    begin
                        reg_we       = 1;
                    end

                    // PUSHV
                    4'b1010:
                    begin
                        stack_push     = 1;
                        stack_data_sel = 2'd1;
                    end

                    // PUSHR
                    4'b1011:
                    begin
                        stack_push     = 1;
                        stack_data_sel = 2'd0;
                    end

                    // POP
                    4'b1100:
                    begin
                        reg_we       = 1;
                        reg_data_sel = 2'd1;
                        stack_pop    = 1;
                    end

                    // JMP
                    4'b1101:
                    begin
                        pc_load     = 1;
                        pc_data_sel = 0;
                    end

                    // CALL
                    4'b1110:
                    begin
                        stack_push     = 1;
                        stack_data_sel = 2'd2;

                        pc_load     = 1;
                        pc_data_sel = 0;
                    end

                    // RET
                    4'b1111:
                    begin
                        pc_load     = 1;
                        pc_data_sel = 1;
                        stack_pop   = 1;
                    end
                endcase
            end
        endcase
    end

endmodule