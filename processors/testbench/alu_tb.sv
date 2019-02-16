/*
  alu test bench
*/

// mapped needs this
`include "alu_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_tb;
  import cpu_types_pkg::*;
  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  alu_if aluif ();
  // test program
  test PROG (CLK, nRST, aluif);
  // DUT
`ifndef MAPPED
  alu DUT(aluif);
`else
  alu DUT(
    .\aluif.aluop (aluif.aluop),
    .\aluif.portA (aluif.portA),
    .\aluif.portB (aluif.portB),
    .\aluif.outputPort (aluif.outputPort),
    .\aluif.zero (aluif.zero),
    .\aluif.negative (aluif.negative),
    .\aluif.overflow (aluif.overflow)
  );
`endif

endmodule

program test( input logic CLK, output logic nRST, alu_if.tb tbif);
import cpu_types_pkg::*;
//int testcase = 0;
initial begin
	tbif.portA = '0;
	tbif.portB = '0;
	nRST = 0;
	
	@(posedge CLK);
	@(posedge CLK);
	nRST = 1;
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_SLL;
	tbif.portA = 31'b1010101010101010100000001111111;
	tbif.portB = 4;
	if(tbif.portA << tbif.portB == tbif.outputPort)
		$display("Left Shift Test Passed");
	else
		$display("Left Shift Test FAILED");
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_SRL;
	tbif.portA = 31'b1110000000101010100000001111111;
	tbif.portB = 4;
	if(tbif.portA >> tbif.portB == tbif.outputPort)
		$display("Right Shift Test Passed");
	else
		$display("Right Shift Test FAILED");
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_ADD;
	tbif.portA = 5;
	tbif.portB = 5;
	if(tbif.portA + tbif.portB == tbif.outputPort)
		$display("Basic Add Test Passed");
	else
		$display("Basic Add Test FAILED");
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_SUB;
	tbif.portA = 12;
	tbif.portB = 5;
	if(tbif.portA - tbif.portB == tbif.outputPort)
		$display("Basic Sub Test Passed");
	else
		$display("Basic Sub Test FAILED");
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_AND;
	tbif.portA = 31'b0101010101010101010101010111111;
	tbif.portB = 31'b1010101010101010101010101010101;
	if(tbif.portA & tbif.portB == tbif.outputPort)
		$display("AND Test Passed");
	else
		$display("AND Test FAILED");
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_OR;
	tbif.portA = 31'b0101010010101010101010101010101;
	tbif.portB = 31'b1010101010101010101010101010101;
	if(tbif.portA | tbif.portB == tbif.outputPort)
		$display("Or Test Passed");
	else
		$display("Or Test FAILED");
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_XOR;
	tbif.portA = 31'b0000000001111010101011111000011;
	tbif.portB = 31'b0000000001111101010100011000111;
	if(tbif.portA ^ tbif.portB == tbif.outputPort)
		$display("XOR Test Passed");
	else
		$display("XOR Test FAILED");
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_NOR;
	tbif.portA = 31'b0000000001111010101011111000011;
	tbif.portB = 31'b0000000001111101010100011000111;
	if(~(tbif.portA | tbif.portB) == tbif.outputPort)
		$display("NOR Test Passed");
	else
		$display("NOR Test FAILED");
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_SLT;
	tbif.portA = -6;
	tbif.portB = 4;
	if($signed(tbif.portA) < $signed(tbif.portB) == tbif.outputPort)
		$display("Signed Less Test Passed");
	else
		$display("Signed Less Test FAILED");
	
	@(posedge CLK);
	@(posedge CLK);
	tbif.aluop = ALU_SLTU;
	tbif.portA = -6;
	tbif.portB = 4;
	if(tbif.portA < tbif.portB == tbif.outputPort)
		$display("Unsigned Less Test Passed");
	else
		$display("Unsigned Less Test FAILED");
	@(posedge CLK);
	@(posedge CLK);

end
endprogram
