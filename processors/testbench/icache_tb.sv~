/*
  Eric Villasenor
  evillase@gmail.com
  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

`include "caches_if.vh"
`include "datapath_cache_if.vh"
`include "cpu_types_pkg.vh"

`timescale 1 ns / 1 ns

module icache_tb;

  parameter PERIOD = 10;
  logic CLK = 0, nRST;

  always #(PERIOD/2) CLK++;

  // interface delcaration
  caches_if cif ();
  datapath_cache_if dcif ();
  // test program setup
  test PROG ();

`ifndef MAPPED
  icache DUT(CLK, nRST, dcif, cif);

`else
  icache DUT(
    .\CLK(CLK),
    .\nRST(nRST),
    .\dcif.imemREN(dcif.imemREN),
    .\dcif.imemaddr(dcif.imemaddr),
    .\cif.dwait(cif.dwait),
    .\cif.dload(cif.dload),
    .\cif.iwait(cif.iwait),
    .\cif.iload(cif.iload)
  );
`endif

endmodule

program test;

import cpu_types_pkg::*;

initial begin

  int testNum;

  icache_tb.nRST = 1;
  icache_tb.dcif.imemaddr = '0;
  icache_tb.dcif.halt = 0;
  icache_tb.dcif.imemREN = 1;
  icache_tb.dcif.dmemREN = 0;
  icache_tb.dcif.dmemWEN = 0;
  icache_tb.dcif.datomic = 0;
  icache_tb.dcif.dmemstore = 0;
  icache_tb.dcif.dmemaddr = 0;
  icache_tb.dcif.imemaddr = 0;
  icache_tb.cif.dwait = 0;
  icache_tb.cif.dload = 0;
  icache_tb.cif.ccwait = 0;
  icache_tb.cif.ccinv = 0;
  icache_tb.cif.ccsnoopaddr = 0;
  icache_tb.cif.iwait = 1;
  icache_tb.cif.iload = 0;

	
  icache_tb.nRST = 0;
  #(5);
  icache_tb.nRST = 1;
  //Write to index 1, tag = '1
  icache_tb.dcif.imemaddr = {26'h3FFFFFF ,6'b000100};
  #(5);
  icache_tb.cif.iload = 32'hABCDEF00;
  icache_tb.cif.iwait = 0;
  #(15);
  icache_tb.cif.iwait = 1;
  //Write to index 2, tag = '1
  icache_tb.dcif.imemaddr = {26'h3FFFFFF ,6'b001000};
  #(5);
  icache_tb.cif.iload = 32'h12345678;
  icache_tb.cif.iwait = 0;
  #(15);
  icache_tb.cif.iwait = 1;
  //Write to index 3, with tag = '1
  icache_tb.dcif.imemaddr = {26'h3FFFFFF ,6'b001100};
  icache_tb.cif.iload = 32'h10101010;
  icache_tb.cif.iwait = 0;
  icache_tb.dcif.imemREN = 1;
  #(10);

  //fetch
  
  icache_tb.dcif.imemaddr = {26'h3ffffff ,6'b000100};
  icache_tb.cif.iload = 32'h00000000;
  icache_tb.cif.iwait = 1;
  icache_tb.dcif.imemREN = 1;
  #(5);
  testNum = 1;
  
	if(dcif.ihit == 1 && dcif.imemload == 32'hABCDEF00 && cif.iREN == 0 && cif.iaddr == 0)
	begin
		 $display("testcase %d passed", testNum);
	end
	else
	begin
		$display("testcase %d failed", testNum);
	end
   #(5);
  
  //mismatch
 
  icache_tb.dcif.imemaddr = {26'h3fffffe ,6'b001000};
  icache_tb.cif.iload = 32'hDEADBEEF;
  icache_tb.cif.iwait = 0;
  icache_tb.dcif.imemREN = 1;
  #(5);
  testNum = 2;
  
	if(dcif.ihit == 1 && dcif.imemload == 32'hDEADBEEF && cif.iREN == 1 && cif.iaddr == {26'h3fffffe ,6'b001000})
	begin
		 $display("testcase %d passed", testNum);
	end
	else
	begin
		$display("testcase %d failed", testNum);
	end
   #(5);
  
  
  //test imemren  
  icache_tb.dcif.imemaddr = {26'h3fffffe ,6'b000100};
  icache_tb.cif.iload = 32'h00000000;
  icache_tb.cif.iwait = 1;
  icache_tb.dcif.imemREN = 0;
  #(5);
  testNum = 3;
  
	if(dcif.ihit == 0 && dcif.imemload == 0 && cif.iREN == 0 && cif.iaddr == 0)
	begin
		 $display("testcase %d passed", testNum);
	end
	else
	begin
		$display("testcase %d failed", testNum);
	end
  #(30);
end  
endprogram

