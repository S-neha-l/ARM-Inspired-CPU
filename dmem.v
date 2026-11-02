module dmem(input  clk, we,
            input  [31:0] a, wd,
            output [31:0] rd);

    reg [31:0] RAM[63:0];

    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1)
            RAM[i] = i;   // use 32'b0 if you want all zeros
    end

    // READ
    assign rd = RAM[a[31:2]]; 

    // WRITE
    always @(posedge clk)
        if (we)
            RAM[a[31:2]] <= wd;

endmodule
