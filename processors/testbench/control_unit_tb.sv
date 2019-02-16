// interface
`include "control_unit_if.vh"
`include "cpu_ram_if.vh"

// types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module control_unit_tb;
  // clock period
  parameter PERIOD = 10;
  
  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  control_unit_if cuif();

  // test program
  test PROG (CLK,nRST,cuif);
  control_unit DUT(cuif);

endmodule

program test(input logic CLK, output logic nRST, control_unit_if cuif);
  import cpu_types_pkg::*;
  parameter PERIOD = 20;

  initial 
  begin
  @(posedge CLK);
  @(posedge CLK);
  nRST = 0;
  
  cuif.instruction = 32'h00223021; //addu
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h3025000F; // andi
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h00226827; // nor
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h00222024; // and
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h24678740; // addiu
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h00221825; // or
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h00824023; // subu
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h00A24826;  //xor
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h00AC4021; // addu
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h382AF33F;  //xori
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h01C16006;  // srlv
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;
  cuif.instruction = 32'h01C15804;  // sllv
  @(negedge CLK);
  @(negedge CLK);
  #PERIOD;

  $finish;

  end
endprogram
