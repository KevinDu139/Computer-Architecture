// interface
`include "request_unit_if.vh"
`include "cpu_ram_if.vh"

// types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module request_unit_tb;
  // clock period
  parameter PERIOD = 10;
  
  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  request_unit_if ruif();

  // test program
  test PROG (CLK, nRST, ruif);
  request_unit DUT(CLK, nRST, ruif);

endmodule

program test(input logic CLK, output logic nRST, request_unit_if ruif);
  import cpu_types_pkg::*;
  parameter PERIOD = 20;

  initial 
  begin
  @(posedge CLK);
  @(posedge CLK);
  nRST = 1;
  
  ruif.ihit = 0;
  ruif.dhit = 0;
  ruif.dREN = 0;
  ruif.dWEN = 0;
  @(posedge CLK);
  @(posedge CLK);

  ruif.ihit = 1;
  ruif.dhit = 0;
  ruif.dREN = 0;
  ruif.dWEN = 0;
  @(posedge CLK);
  @(posedge CLK);

  ruif.ihit = 0;
  ruif.dhit = 0;
  ruif.dREN = 1;
  ruif.dWEN = 1;
  @(posedge CLK);
  @(posedge CLK);

  ruif.ihit = 1;
  ruif.dhit = 0;
  ruif.dREN = 1;
  ruif.dWEN = 1;
  @(posedge CLK);
  @(posedge CLK);

  ruif.ihit = 1;
  ruif.dhit = 1;
  ruif.dREN = 1;
  ruif.dWEN = 1;
  @(posedge CLK);
  @(posedge CLK);

  ruif.ihit = 0;
  ruif.dhit = 1;
  ruif.dREN = 1;
  ruif.dWEN = 1;
  @(posedge CLK);
  @(posedge CLK);

  ruif.ihit = 1;
  ruif.dhit = 0;
  ruif.dREN = 1;
  ruif.dWEN = 1;
  @(posedge CLK);
  @(posedge CLK);

  nRST = 0;
  @(posedge CLK);
  @(posedge CLK);

  nRST = 1;
  @(posedge CLK);
  @(posedge CLK);
  


  $finish;

  end
endprogram
