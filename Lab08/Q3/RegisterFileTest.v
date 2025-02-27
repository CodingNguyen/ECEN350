`timescale 1ns / 1ps
`define STRLEN 32

module RegisterFileTest_v;


	task passTest;
		input [63:0] actualOut, expectedOut;
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
	reg [63:0] BusW;
	reg [4:0] RA;
	reg [4:0] RB;
	reg [4:0] RW;
	reg RegWr;
	reg Clk;
	reg [7:0] passed;

	// Outputs
	wire [63:0] BusA;
	wire [63:0] BusB;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.BusA(BusA), 
		.BusB(BusB), 
		.BusW(BusW), 
		.RA(RA), 
		.RB(RB), 
		.RW(RW), 
		.RegWr(RegWr), 
		.Clk(Clk)
	);

    initial //This initial block used to dump all wire/reg values to dump file
    begin
        $dumpfile("RegisterFileTest-2.vcd");
        $dumpvars(0,RegisterFileTest_v);
    end

	initial begin
		// Initialize Inputs
		BusW = 0;
		RA = 0;
		RB = 0;
		RW = 0;
		RegWr = 0;
		Clk = 1;
		passed = 0;		
		#10;

		// Initialize register values to be equal to its register number (Except 31 = 0)
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd0, 64'h0, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd1, 64'h1, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd2, 64'h2, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd3, 64'h3, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd4, 64'h4, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd5, 64'h5, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd6, 64'h6, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd7, 64'h7, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd8, 64'h8, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd9, 64'h9, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd10, 64'd10, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd11, 64'd11, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd12, 64'd12, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd13, 64'd13, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd14, 64'd14, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd15, 64'd15, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd16, 64'd16, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd17, 64'd17, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd18, 64'd18, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd19, 64'd19, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd20, 64'd20, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd21, 64'd21, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd22, 64'd22, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd23, 64'd23, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd24, 64'd24, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd25, 64'd25, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd26, 64'd26, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd27, 64'd27, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd28, 64'd28, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd29, 64'd29, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd30, 64'd30, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd31, 64'd31, 1'b1};#10; Clk = 0; #10; Clk = 1;
		#10;

		// Add stimulus here
		{RA, RB, RW, RegWr, BusW} = {5'h0, 5'h1, 5'h0, 1'b0, 64'h0};
		#4;
		passTest(BusA, 64'h0, "Initial Value Check 0", passed);
		passTest(BusB, 64'h1, "Initial Value Check 1", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h0, "Final Value Check 0", passed);
		passTest(BusB, 64'h1, "Final Value Check 1", passed);
		$display();

		{RA, RB, RW, RegWr, BusW} = {5'h2, 5'h3, 5'h1, 1'b0, 64'h1000};
		#4;
		passTest(BusA, 64'h2, "Initial Value Check 2", passed);
		passTest(BusB, 64'h3, "Initial Value Check 3", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h2, "Final Value Check 2", passed);
		passTest(BusB, 64'h3, "Final Value Check 3", passed);
		$display();

		{RA, RB, RW, RegWr, BusW} = {5'h4, 5'h5, 5'h0, 1'b1, 64'h1000};
		#4;
		passTest(BusA, 64'h4, "Initial Value Check 4", passed);
		passTest(BusB, 64'h5, "Initial Value Check 5", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h4, "Final Value Check 4", passed);
		passTest(BusB, 64'h5, "Final Value Check 5", passed);
		$display();

		{RA, RB, RW, RegWr, BusW} = {5'h6, 5'h7, 5'ha, 1'b1, 64'h1010};
		#4;
		passTest(BusA, 64'h6, "Initial Value Check 6", passed);
		passTest(BusB, 64'h7, "Initial Value Check 7", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h6, "Final Value Check 6", passed);
		passTest(BusB, 64'h7, "Final Value Check 7", passed);
		$display();

		{RA, RB, RW, RegWr, BusW} = {5'h8, 5'h9, 5'hb, 1'b1, 64'h103000};
		#4;
		passTest(BusA, 64'h8, "Initial Value Check 8", passed);
		passTest(BusB, 64'h9, "Initial Value Check 9", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h8, "Final Value Check 8", passed);
		passTest(BusB, 64'h9, "Final Value Check 9", passed);
		$display();

		{RA, RB, RW, RegWr, BusW} = {5'ha, 5'hb, 5'hc, 1'b0, 64'h0};
		#4;
		passTest(BusA, 64'h1010, "Initial Value Check 10", passed);
		passTest(BusB, 64'h103000, "Initial Value Check 11", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h1010, "Final Value Check 10", passed);
		passTest(BusB, 64'h103000, "Final Value Check 11", passed);
		$display();

		{RA, RB, RW, RegWr, BusW} = {5'hc, 5'hd, 5'hd, 1'b1, 64'habcd};
		#4;
		passTest(BusA, 64'hc, "Initial Value Check 12", passed);
		passTest(BusB, 64'hd, "Initial Value Check 13", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'hc, "Final Value Check 12", passed);
		passTest(BusB, 64'habcd, "Final Value Check 13", passed);
		$display();

		{RA, RB, RW, RegWr, BusW} = {5'he, 5'hf, 5'he, 1'b0, 64'h9080009};
		#4;
		passTest(BusA, 64'he, "Initial Value Check 14", passed);
		passTest(BusB, 64'hf, "Initial Value Check 15", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'he, "Final Value Check 14", passed);
		passTest(BusB, 64'hf, "Final Value Check 15", passed);
		$display();
		allPassed(passed, 32);
	end
      
endmodule