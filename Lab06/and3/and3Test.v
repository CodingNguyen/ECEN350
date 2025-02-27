`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:06:33 03/02/2009
// Design Name:   Decode24
// Module Name:   E:/350/Lab6/Decode24/Decode24Test.v
// Project Name:  Decode24
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decode24
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 15
module and3test_v;

	task passTest;
		input [3:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
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
	reg [2:0] in;
    reg [7:0]      passed;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	and3 dut (
		.a(in[0]),
        .b(in[1]),
        .c(in[2]),
		.y(y)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		passed = 0;

		// Add stimulus here
		#90; in = 0; #10; passTest(y, 0, "Input 0", passed);
		#90; in = 1; #10; passTest(y, 0, "Input 1", passed);
		#90; in = 2; #10; passTest(y, 0, "Input 2", passed);
		#90; in = 3; #10; passTest(y, 0, "Input 3", passed);
        #90; in = 4; #10; passTest(y, 0, "Input 4", passed);
		#90; in = 5; #10; passTest(y, 0, "Input 5", passed);
		#90; in = 6; #10; passTest(y, 0, "Input 6", passed);
		#90; in = 7; #10; passTest(y, 1, "Input 7", passed);
		#90;
		
		allPassed(passed, 8);

	end
      
endmodule