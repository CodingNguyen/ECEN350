`timescale 1ns / 1ps
`define STRLEN 15
module gatestest_v;

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
	reg [3:0] a,b;
    reg [7:0] passed;

	// Outputs
	wire [3:0] y1, y2, y3, y4, y5;

	// Instantiate the Unit Under Test (UUT)
	gates dut (
		.a(a),
        .b(b),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .y4(y4),
        .y5(y5)
    );

	initial begin
		// Initialize Inputs
		passed = 0;
        a = 0;
        b = 0;

		// Add stimulus here
		#90; in = 0; #10; passTest(y, 0, "Input 0", passed);
		#90; in = 1; #10; passTest(y, 0, "Input 1", passed);
		#90; in = 2; #10; passTest(y, 0, "Input 2", passed);
		#90; in = 3; #10; passTest(y, 0, "Input 3", passed);
        #90; in = 4; #10; passTest(y, 0, "Input 4", passed);
		#90;
		
		allPassed(passed, 8);

	end
      
endmodule