/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;

  assign ccif.dload = (ccif.ramstate == ACCESS)? ccif.ramload : '0;
  assign ccif.iload = ccif.iREN ? ccif.ramload : '0;
  assign ccif.dwait = (ccif.dREN || ccif.dWEN) && ~(ccif.ramstate == ACCESS);
  assign ccif.iwait = ccif.iREN && (ccif.dREN || ccif.dWEN || (~ccif.ramstate == ACCESS)); 
  assign ccif.ramWEN = ccif.dWEN;
  assign ccif.ramREN = ((ccif.iREN || ccif.dREN) && !(ccif.dWEN)) ? 1 : 0;
  assign ccif.ramaddr = (ccif.dREN || ccif.dWEN) ? ccif.daddr : ccif.iaddr;
  assign ccif.ramstore = ccif.dstore;

endmodule
