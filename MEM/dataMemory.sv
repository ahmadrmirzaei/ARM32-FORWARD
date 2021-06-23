`timescale 1ns/1ns

module dataMemory (
    input clk, rst,

    input MEM_R_EN, MEM_W_EN,
    input [31:0] alu_res, rm_val,
    
    output [31:0] data_mem
);

    integer i;
    integer fd;

    reg signed [31:0] memory [0:63];

    assign data_mem = MEM_R_EN ? memory[(alu_res-1023)/4] : 32'b0;

    initial begin
        fd = $fopen("./build/memory.txt", "w");
        for (i = 0; i<64; i=i+1) begin
            memory[i] = 0;
            $fdisplay(fd, "%d: %d", 4*i+1024, memory[i]);
        end
        $fclose(fd);
    end

    always@(negedge clk) begin
        if (MEM_W_EN) begin
            memory[(alu_res-1023)/4] = rm_val;
            fd = $fopen("./build/memory.txt", "w");
            for (i = 0; i<64; i=i+1)
                $fdisplay(fd, "%d: %d", 4*i+1024, memory[i]);
            $fclose(fd);
        end
    end

endmodule