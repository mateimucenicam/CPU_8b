module ROM_256x8b (
    input  logic [7:0] addr,
    output logic [7:0] data
);

    logic [7:0] mem [0:255];

    initial begin
        // Exemplu program
        //PUNEM IN R14(E) 240(ADRESA SUPRPGRAM AUTOCONCATENARE)  
        mem[8'd0] = 8'hAF;  //PUSHV F
        mem[8'd1] = 8'hCE;  //POP R14
        mem[8'd2] = 8'hA4;  //PUSHV 4
        mem[8'd3] = 8'h2E;  //SHL R14
       
        //pune AB in vf stivei
        mem[8'd4] = 8'hAB;  //PUSH B
        mem[8'd5] = 8'hAA;  //PUSH A
        mem[8'd6] = 8'hEE;  //CALL R14
        
        // pune in R0 ce e in vf stivei 
        mem[8'd7] = 8'hC0;  //POP R0
        
        //apelam adresa d30
        mem[8'd8] = 8'hAE;  //PUSHV E
        mem[8'd9] = 8'hA1;  //PUSHV 1
        mem[8'd10] = 8'hEE; //CALL R14
        mem[8'd11] = 8'hC1; //POP R1
        mem[8'd12] = 8'hD1; //JMP R1
        
        mem[8'd30] = 8'hA2; //PUSHV 2
        mem[8'd31] = 8'hA8; //PUSHV 8
        mem[8'd32] = 8'hC2; //POP R2
        mem[8'd33] = 8'h12; //SUB R2
        
        
        //subprogram de autoconcatenare
        mem[8'd240] = 8'hCD; //POP R13(PC)
        mem[8'd241] = 8'hCF; //POP R15
        mem[8'd242] = 8'hA4; //PUSH 4
        mem[8'd243] = 8'h2F; //SHL R15
        mem[8'd244] = 8'h0F; //ADD R15
        mem[8'd245] = 8'hBF; //PUSHR R15
        mem[8'd246] = 8'hBD; //PUSHR R13
        mem[8'd247] = 8'hF0; //RET
    end

    assign data = mem[addr];

endmodule