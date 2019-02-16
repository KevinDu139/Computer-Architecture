/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif ();
  // test program
  test PROG (CLK, nRST, rfif);
  // DUT
`ifndef MAPPED
  register_file DUT(CLK, nRST, rfif);
`else
  register_file DUT(
    .\rfif.rdat2 (rfif.rdat2),
    .\rfif.rdat1 (rfif.rdat1),
    .\rfif.wdat (rfif.wdat),
    .\rfif.rsel2 (rfif.rsel2),
    .\rfif.rsel1 (rfif.rsel1),
    .\rfif.wsel (rfif.wsel),
    .\rfif.WEN (rfif.WEN),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

program test( input logic CLK, output logic nRST, register_file_if.tb tbif);
int testcase = 0;
initial begin
	
	testcase = 0; //start
	nRST = 0;
	tbif.WEN = 0;
	
	@(negedge CLK);
	@(negedge CLK);
	nRST = 1;
	testcase = 1; //init
	tbif.WEN = 1;
	tbif.wsel = 5;
	tbif.wdat = 2;
	tbif.rsel1 = 0;
	tbif.rsel2 = 0;
	
	@(negedge CLK);
	@(negedge CLK);
	testcase = 2; // chk rdat1
	tbif.rsel1 = 5;
	tbif.wdat = 7;
	tbif.wsel = 13;

	@(negedge CLK);
	@(negedge CLK);
	testcase = 3; //chk rdat2
	tbif.WEN = 0;
	tbif.rsel2 = 13;

	@(negedge CLK);
	@(negedge CLK);
	testcase = 4; //try init reg 0
	tbif.WEN = 1;
	tbif.wdat = 11;
	tbif.wsel = 0;
	tbif.rsel1 = 13;
	tbif.rsel2 = 5;

	@(negedge CLK);
	@(negedge CLK);
	testcase = 5; //try get reg 0
	tbif.WEN = 0;
	tbif.rsel1 = 0;

	@(negedge CLK);
	@(negedge CLK);
	testcase = 6; //chk nrst
	nRST = 0;

	@(negedge CLK);
	@(negedge CLK);
	nRST = 1;

	@(negedge CLK);
	@(negedge CLK);
	tbif.rsel1 = 5;
	tbif.rsel2 = 13;
end
endprogram
