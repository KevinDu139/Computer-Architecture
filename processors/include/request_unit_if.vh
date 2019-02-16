/*
  DuKe
  du139@purdue.edu

  request unit interface
*/
`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface request_unit_if;
  // import types
  import cpu_types_pkg::*;

  logic dWEN, dREN, dhit, ihit, dmemREN, dmemWEN, imemREN;
  
  // alu ports
  modport ru (
    input   dWEN, dREN, ihit, dhit,
    output  dmemREN, dmemWEN, imemREN
  );
  // request unit tb
  //modport tb (
    //input   
    //output  
  //);
endinterface

`endif //REQUEST_UNIT_IF_VH
