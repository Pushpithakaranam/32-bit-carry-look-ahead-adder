`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:03:07 02/23/2026
// Design Name:   cla_32bit
// Module Name:   D:/mrcew_mini_2026/ECE-C/carry_look_ahead_adder_32bit/tb.v
// Project Name:  carry_look_ahead_adder_32bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg cin;

	// Outputs
	wire [31:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	cla_32bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 345;
		b = 234;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 645;
		b = 534;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
		a = 745;
		b = 334;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
		a = 345;
		b = 354;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
		$finish;
	end
      
endmodule

