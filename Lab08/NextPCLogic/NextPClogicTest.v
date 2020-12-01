`timescale 1ns / 1ps
`define STRLEN 15

module NextPClogicTest_v;
    // Input
    reg [63:0] CurrentPC, SignExtImm64;
    reg Branch, ALUZero, Uncondbranch;

    // Output
    wire [63:0] NextPC; 

    // Instantiate the Device Under Test (DUT)
    NextPClogic dut
    (
        .NextPC(NextPC),
        .CurrentPC(CurrentPC),
        .SignExtImm64(SignExtImm64),
        .Branch(Branch),
        .ALUZero(ALUZero),
        .Uncondbranch(Uncondbranch)
    );

    initial //This initial block used to dump all wire/reg values to dump file
    begin
        $dumpfile("NextPClogicTest.vcd");
        $dumpvars(0,NextPClogicTest_v);
    end

    initial
    begin
        // Initialize inputs
        CurrentPC = 64'h0;
        SignExtImm64 = 0;
        Branch = 0;
        ALUZero = 0;
        Uncondbranch = 0;
        
        // No branch test
        CurrentPC = 64'h8000000000000000; SignExtImm64 = 64'hffff; Branch = 0; ALUZero = 0; Uncondbranch = 0;
        #90; $display("CurrentPC = %h\nSignExtImm64 = %h\nBranch = %h\nALUZero = %h\nUncondbranch = %h", CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
        if(NextPC == CurrentPC + 4)
            $display("NextPC = %h\nPASSED\n", NextPC);
        else
            $display("NextPC = %h\nFAILED\n", NextPC);

        // Positive Unconditional branch test
        CurrentPC = 64'h8000000000000000; SignExtImm64 = 64'hffff; Branch = 0; ALUZero = 0; Uncondbranch = 1;
        #90; $display("CurrentPC = %h\nSignExtImm64 = %h\nBranch = %h\nALUZero = %h\nUncondbranch = %h", CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
        if(NextPC == CurrentPC + (4 * SignExtImm64))
            $display("NextPC = %h\nPASSED\n", NextPC);
        else
            $display("NextPC = %h\nFAILED\n", NextPC);
        // Negative Unconditional branch test
        CurrentPC = 64'h8000000000000000; SignExtImm64 = -64'hffff; Branch = 0; ALUZero = 0; Uncondbranch = 1;
        #90; $display("CurrentPC = %h\nSignExtImm64 = %h\nBranch = %h\nALUZero = %h\nUncondbranch = %h", CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
        if(NextPC == CurrentPC + (4 * SignExtImm64))
            $display("NextPC = %h\nPASSED\n", NextPC);
        else
            $display("NextPC = %h\nFAILED\n", NextPC);

        // Conditional branch with low ALUZero test
        CurrentPC = 64'h8000000000000000; SignExtImm64 = 64'hffff; Branch = 1; ALUZero = 0; Uncondbranch = 0;
        #90; $display("CurrentPC = %h\nSignExtImm64 = %h\nBranch = %h\nALUZero = %h\nUncondbranch = %h", CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
        if(NextPC == CurrentPC + 4)
            $display("NextPC = %h\nPASSED\n", NextPC);
        else
            $display("NextPC = %h\nFAILED\n", NextPC);
        // Low branch with high ALUZero test
        CurrentPC = 64'h8000000000000000; SignExtImm64 = 64'hffff; Branch = 0; ALUZero = 1; Uncondbranch = 0;
        #90; $display("CurrentPC = %h\nSignExtImm64 = %h\nBranch = %h\nALUZero = %h\nUncondbranch = %h", CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
        if(NextPC == CurrentPC + 4)
            $display("NextPC = %h\nPASSED\n", NextPC);
        else
            $display("NextPC = %h\nFAILED\n", NextPC);
        // Positive Conditional branch with high ALUZero test
        CurrentPC = 64'h8000000000000000; SignExtImm64 = 64'hffff; Branch = 1; ALUZero = 1; Uncondbranch = 0;
        #90; $display("CurrentPC = %h\nSignExtImm64 = %h\nBranch = %h\nALUZero = %h\nUncondbranch = %h", CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
        if(NextPC == CurrentPC + (4 * SignExtImm64))
            $display("NextPC = %h\nPASSED\n", NextPC);
        else
            $display("NextPC = %h\nFAILED\n", NextPC);
        // Negative Conditional branch with high ALUZero test
        CurrentPC = 64'h8000000000000000; SignExtImm64 = -64'hffff; Branch = 1; ALUZero = 1; Uncondbranch = 0;
        #90; $display("CurrentPC = %h\nSignExtImm64 = %h\nBranch = %h\nALUZero = %h\nUncondbranch = %h", CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
        if(NextPC == CurrentPC + (4 * SignExtImm64))
            $display("NextPC = %h\nPASSED\n", NextPC);
        else
            $display("NextPC = %h\nFAILED\n", NextPC);
   end
endmodule