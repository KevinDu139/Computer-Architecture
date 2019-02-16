/*
  jingchen lei
  hazard_unit test bench
*/

// mapped needs this
`include "forward_unit_if.vh"
// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module hazard_unit_tb;

import cpu_types_pkg::*;
  parameter PERIOD = 10;


  // clock
  logic CLK = 0;
  always #(PERIOD/2) CLK++;

  // interface
  forward_unit_if fuif ();
  // test program
  test PROG (fuif);
  // DUT
`ifndef MAPPED
  forward_unit DUT(fuif);
`else
  hazard_unit DUT(
    .\fuif.idex_instr(fuif.idex_instr),
    .\fuif.exmem_instr (fuif.exmem_instr),
    .\fuif.rs (fuif.rs),
    .\fuif.rt (fuif.rt),
    .\fuif.rdm (fuif.rdm),
    .\fuif.rdw (fuif.rdw),
    .\fuif.port1 (fuif.port1),
    .\fuif.port2 (fuif.port2),
  );
`endif

endmodule

program test(
	forward_unit_if fuif
);
parameter PERIOD = 10;
initial begin
    //branch
	huif.idex_instr = 32'h100000001;
	huif.exmem_instr = 32'h100000001;
	huif.jsel = 4;
	huif.RegWEN = 0;
    #(PERIOD)
	if(huif.freeze==0 && huif.flush==1)
	begin
		$display("branch test case passed");
	end
	else
	begin
		$display("branch test case FAILED");		

	end
    #(PERIOD)
    //rtype
	huif.ifid_instr = 32'h00824023; //SUBU R8, R4, R2
	huif.idex_instr = 32'h3025000F; //ANDI R5, R1, 15   h00A24826; //XOR R9, R5, R2
	huif.exmem_instr = 32'h00222024; //AND R4, R1, R2
	huif.jsel = 0;//not relevant
	huif.RegWEN = 0;
	$display(huif.ifid_instr[20:16]);
	$display(huif.ifid_instr[25:21]);
	$display(huif.idex_instr[15:11]);
	$display(huif.exmem_instr[15:11]);

    #(PERIOD)
	if(huif.freeze==1 && huif.flush==0)
	begin
		$display("rtype test case passed");
	end	
	else
	begin
		$display("rytpe test case FAILED");		
	end
end
