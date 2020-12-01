`timescale 1ns / 1ps
`define STRLEN 15
module SignExtenderTest_v;

   task passTest;
      input [63:0] actualOut, expectedOut;
      input [`STRLEN*8:0] testType;
      inout [7:0]         passed;
      
      if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
      else $display ("%s failed: %d should be %d", testType, actualOut, expectedOut);
   endtask
   
   task allPassed;
      input [7:0] passed;
      input [7:0] numTests;
      
      if(passed == numTests) $display ("All tests passed");
      else $display("Some tests failed");
   endtask

    // Inputs
    reg [25:0] Instr; 
    reg [1:0] Ctrl;
    reg [7:0]      passed;

    // Outputs
    wire [63:0] BusImm;


    // Instantiate the Device Under Test (DUT)
    SignExtender dut
    (
		.BusImm(BusImm), 
		.Instr(Instr), 
		.Ctrl(Ctrl)
	);

    initial //This initial block used to dump all wire/reg values to dump file
    begin
        $dumpfile("SignExtenderTest.vcd");
        $dumpvars(0,SignExtenderTest_v);
    end
    initial
    begin
        // Initialize Inputs
        Instr = 0;
        Ctrl = 0;
        passed = 0;

        // I-type test
        #90; Instr = 'b00000111110000000000000000;
        Ctrl = 0; // sign extend test with 0 MSB
        #10; passTest(BusImm, 'b011111000000, "I-type 0 test", passed);

        #90; Instr = 'b00001111110000000000000000;
        Ctrl = 0; // sign extend test with 1 MSB
        #10; passTest(BusImm, 'b111111000000, "I-type 1 test", passed);

        // D-type test
        #90; Instr = 'b00000011110000000000000000;
        Ctrl = 1; // sign extend test with 0 MSB
        #10; passTest(BusImm, 'b11110000, "D-type 0 test", passed);
        
        #90; Instr = 'b00000111100000000000000000;
        Ctrl = 1; // sign extend test with 1 MSB
        #10; passTest(BusImm, 'b1111111111111111111111111111111111111111111111111111111111100000, "D-type 1 test", passed);

        // B-type test
        #90; Instr = 'b01000111110000000000000000;
        Ctrl = 2; // sign extend test with 0 MSB
        #10; passTest(BusImm, 'b0100011111000000000000000000, "B-type 0 test", passed);

        #90; Instr = 'b10000011110000000000000000;
        Ctrl = 2; // sign extend test with 1 MSB
        #10; passTest(BusImm, 'b1111111111111111111111111111111111111000001111000000000000000000, "B-type 1 test", passed);

        // CB-type test
        #90; Instr = 'b00010111110000000000000000;
        Ctrl = 3; // sign extend test with 0 MSB
        #10; passTest(BusImm, 'b010111110000000000000, "CB-type 0 test", passed);

        #90; Instr = 'b00100111110000000000000000;
        Ctrl = 3; // sign extend test with 1 MSB
        #10; passTest(BusImm, 'b1111111111111111111111111111111111111111111100111110000000000000, "CB-type 1 test", passed);
        #90;
      
      allPassed(passed, 8);
   end
endmodule