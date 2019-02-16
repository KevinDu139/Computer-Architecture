/*
  DuKe
  du139@purdue.edu

  pipeline register unit interface
*/
`ifndef HAZARD_UNIT_IF_VH
`define HAZARD_UNIT_IF_VH
// all types
`include "cpu_types_pkg.vh"

interface hazard_unit_if;
  // import types
  import cpu_types_pkg::*;

  //ifid vars
  word_t idex_instr, ifid_instr, exmem_instr, branchok, jok;
  logic  freeze, flush, RegWEN, dhit, start;
  logic [2:0] jsel;
  
  // hu ports
  modport hu (
    input idex_instr, ifid_instr, exmem_instr, jsel, RegWEN, dhit, start, branchok, jok,
    output freeze, flush
  );
  endinterface

`endif //HAZARD_UNIT_IF_VH
