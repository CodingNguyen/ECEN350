`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:47 03/05/2009
// Design Name:   ALU
// Module Name:   E:/350/Lab8/ALU/ALUTest.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 32
module ALUTest_v;

	task passTest;
		input [64:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %x should be %x", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask

	// Inputs
	reg [63:0] BusA;
	reg [63:0] BusB;
	reg [3:0] ALUCtrl;
	reg [7:0] passed;

	// Outputs
	wire [63:0] BusW;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.BusW(BusW), 
		.Zero(Zero), 
		.BusA(BusA), 
		.BusB(BusB), 
		.ALUCtrl(ALUCtrl)
	);

	initial begin
		// Initialize Inputs
		BusA = 0;
		BusB = 0;
		ALUCtrl = 0;
		passed = 0;

        // AND Tests
        {BusA, BusB, ALUCtrl} = {64'h27, 64'h987, 4'h0};
        #40; passTest({Zero, BusW}, 65'h7, "AND 0x27,0x987", passed);

        {BusA, BusB, ALUCtrl} = {64'hFFFF, 64'h0, 4'h0};
        #40; passTest({Zero, BusW}, 65'h10000000000000000, "AND 0xFFFF,0x0", passed);

        {BusA, BusB, ALUCtrl} = {64'hFF0A, 64'hFFFF, 4'h0};
        #40; passTest({Zero, BusW}, 65'hFF0A, "AND 0xFF0A,0xFFFF", passed);

        // OR Tests
        {BusA, BusB, ALUCtrl} = {64'hFFFF, 64'h1234, 4'h1};
        #40; passTest({Zero, BusW}, 65'hFFFF, "OR 0xFFFF,0x1234", passed);

        {BusA, BusB, ALUCtrl} = {64'h12, 64'h1200, 4'h1};
        #40; passTest({Zero, BusW}, 65'h1212, "OR 0x12,0x1200", passed);

        {BusA, BusB, ALUCtrl} = {64'h1, 64'hF000, 4'h1};
        #40; passTest({Zero, BusW}, 65'hF001, "OR 0x1,0xF000", passed);

        // ADD Tests
        {BusA, BusB, ALUCtrl} = {64'h27, 64'h987, 4'h2};
        #40; passTest({Zero, BusW}, 65'h9AE, "ADD 0x27,0x987", passed);

        {BusA, BusB, ALUCtrl} = {64'hFF00, 64'hFF, 4'h2};
        #40; passTest({Zero, BusW}, 65'hFFFF, "ADD 0xFF00,0xFF", passed);

        {BusA, BusB, ALUCtrl} = {64'h0, 64'h0, 4'h2};
        #40; passTest({Zero, BusW}, 65'h10000000000000000, "ADD 0x0,0x0", passed);

        // SUB Tests
        {BusA, BusB, ALUCtrl} = {64'h432, 64'h432, 4'h6};
        #40; passTest({Zero, BusW}, 65'h10000000000000000, "SUB 0x432,0x432", passed);

        {BusA, BusB, ALUCtrl} = {64'hFF00, 64'hFF, 4'h6};
        #40; passTest({Zero, BusW}, 65'hFE01, "SUB 0x27,0x987", passed);

        {BusA, BusB, ALUCtrl} = {64'h5, 64'h4, 4'h6};
        #40; passTest({Zero, BusW}, 65'h1, "SUB 0xFF00,0x4", passed);

        // PASSB Tests
        {BusA, BusB, ALUCtrl} = {64'h4312, 64'h69, 4'h7};
        #40; passTest({Zero, BusW}, 65'h69, "PASSB 0x4312,0x69", passed);

        {BusA, BusB, ALUCtrl} = {64'h546, 64'h0, 4'h7};
        #40; passTest({Zero, BusW}, 65'h10000000000000000, "PASSB 0x546,0x0", passed);

        {BusA, BusB, ALUCtrl} = {64'h8098, 64'h1234, 4'h7};
        #40; passTest({Zero, BusW}, 65'h1234, "PASSB 0x8098,0x1234", passed);

		allPassed(passed, 15);
	end
      
endmodule