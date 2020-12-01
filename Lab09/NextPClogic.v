module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 

       input [63:0] CurrentPC, SignExtImm64; // SignExtImm64 is the output of the sign extender

       // Branch is true if the current instruction is a conditional branch instruction
       // Uncondbranch is true if the current instruction is an Unconditional Branch (B)
       // ALUZero is the Zero output of the ALU
       input Branch, ALUZero, Uncondbranch;
       output [63:0] NextPC; 

       // additions with a constant should have a delay of 1
       // general addition should have a delay of 2
       // any multiplexers should have a delay of 1 (includes statements inside if/else statements)
       wire [63:0] shiftSignExt = SignExtImm64 << 2; // shift left 2

       wire AND0 = Branch && ALUZero; // gate logic
       wire muxControl = AND0 || Uncondbranch; // gate logic

       reg [63:0] muxOutput; // result of MUX

       always @ (*)
       begin
              // MUX logic
              if(muxControl)
                     muxOutput <=  #3 CurrentPC + shiftSignExt;
              else
                     muxOutput <= #2 CurrentPC + 4;
       end

       assign NextPC = muxOutput; // Assign next PC
endmodule