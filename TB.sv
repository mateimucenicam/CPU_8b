module TB();

logic clk;
logic reset;

TOP DUT(
    .clk(clk),
    .reset(reset)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #5
        reset = 0;
    end
    
    initial begin
    #1000
        $stop();
    end
    
endmodule
