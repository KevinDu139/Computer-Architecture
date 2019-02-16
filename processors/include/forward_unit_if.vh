/*
  DuKe
  du139@purdue.edu

  pipeline register unit interface
*/
`ifndef FORWARD_UNIT_IF_VH
`define FORWARD_UNIT_IF_VH
// all types
`include "cpu_types_pkg.vh"

interface forward_unit_if;
  // import types
  import cpu_types_pkg::*;

  //fu vars
  regbits_t rs, rt, rdm, rdw;
  logic  exmemRW, memwbRW;
  logic[2:0] port1, port2, port3;
  word_t idex_instr, exmem_instr, memwb_instr;
  
  // fu ports
  modport fu (
    input   rs, rt, rdm, rdw, exmemRW, memwbRW, idex_instr, exmem_instr, memwb_instr,
    output  port1, port2, port3
  );
  endinterface

`endif //PFORWARD_UNIT_VH
