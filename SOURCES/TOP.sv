module TOP(
    input logic clk,
    input logic reset
    );

logic pc_inc;
logic pc_load;
logic ir_load;
logic reg_we;
logic stack_push;
logic stack_pop;


logic [7:0] pc_out; 
logic [7:0] ir_out;
logic [7:0] ROM_data_out;
logic [7:0] REG_REAd_out;   
logic [7:0] result_out;
logic [7:0] stack_top;  

logic [1:0] stack_data_sel;
logic       reg_data_sel;
logic       pc_data_sel;
logic [7:0] pc_data_in;
logic [7:0] stack_data_in;
logic [7:0] reg_data_write;



assign reg_data_write = (reg_data_sel == 1'b0) ? result_out :stack_top;

assign pc_data_in = (pc_data_sel == 1'b0) ? REG_REAd_out :stack_top;

MUX3_8b MUX_STACK_DATA(
    .in0(REG_REAd_out),
    .in1({4'b0000, ir_out[3:0]}),
    .in2(pc_out),
    .sel(stack_data_sel),
    .out(stack_data_in)
);
    
PC PC0(
    .clk(clk),
    .reset(reset),
    .inc(pc_inc),
    .load(pc_load),
    .data_in(pc_data_in),
    .pc_out(pc_out)
);
    
IR IR0(
    .clk(clk),
    .reset(reset),
    .load(ir_load),
    .data_in(ROM_data_out), 
    .ir_out(ir_out)
);    
    
ROM_256x8b ROM_256x8b0(
    .addr(pc_out),
    .data(ROM_data_out)
);    
    
REGISTERS_16x8b REGISTERS_16x8b0(
    .clk(clk),
    .reset(reset),
    .we(reg_we),
    .addr_write(ir_out[3:0]),
    .data_write(reg_data_write),
    .addr_read(ir_out[3:0]),
    .data_read(REG_REAd_out)
);    
    
ALU ALU0(
    .opcode(ir_out[7:4]),
    .A(REG_REAd_out),
    .B(stack_top),
    .result(result_out)
);    
    
STACK_64x8b STACK_64x8b0(
    .clk(clk),
    .reset(reset),
    .push(stack_push),
    .pop(stack_pop),
    .data_in(stack_data_in),
    .top(stack_top)
);    
    
CONTROL_UNIT CONTROL_UNIT0(
    .clk(clk),
    .reset(reset),
    .ir(ir_out),
    .pc_inc(pc_inc),
    .pc_load(pc_load),
    .ir_load(ir_load),
    .reg_we(reg_we),
    .stack_push(stack_push),
    .stack_pop(stack_pop),
    .stack_data_sel(stack_data_sel),
    .reg_data_sel(reg_data_sel),
    .pc_data_sel(pc_data_sel)
);    
    
    
    
    
endmodule
