`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:59:40 03/02/2009
// Design Name:   Mux21
// Module Name:   E:/350/Lab6/Mux21/Mux21Test.v
// Project Name:  Mux21
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux21
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 15
module Mux21Test_v;

	task passTest;
		input actualOut, expectedOut;
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
	
	task stim;
		input [1:0] newIn;
		input newSel;
		output [1:0] setIn;
		output setSel;
		
		begin
			#90;
			setIn = newIn;
			setSel = newSel;
		end
	endtask
	
	// Inputs
	reg [1:0] in;
	reg sel;
	reg [7:0] passed;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Mux21 uut (
		.out(out), 
		.in(in), 
		.sel(sel)
	);

    initial //This initial block used to dump all wire/reg values to dump file
    begin
        $dumpfile("Mux21Test.vcd");
        $dumpvars(0,Mux21Test_v);
    end

	initial begin
		// Initialize Inputs
		in = 0;
		sel = 0;
		passed = 0;
		
		stim(0, 0, in, sel); #10; passTest(out, 0, "Select First 0", passed);
		stim(1, 0, in, sel); #10; passTest(out, 1, "Select First 1", passed);
		stim(2, 0, in, sel); #10; passTest(out, 0, "Select First 2", passed);
		stim(3, 0, in, sel); #10; passTest(out, 1, "Select First 3", passed);
		stim(0, 1, in, sel); #10; passTest(out, 0, "Select Second 0", passed);
		stim(1, 1, in, sel); #10; passTest(out, 0, "Select Second 1", passed);
		stim(2, 1, in, sel); #10; passTest(out, 1, "Select Second 2", passed);
		stim(3, 1, in, sel); #10; passTest(out, 1, "Select Second 3", passed);
		#10;
		
		allPassed(passed, 8);
	end
      
endmodule