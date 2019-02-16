/*
  DuKe
  du139@purdue.edu

  alu interface
*/
`ifndef ALU_IF_VH
`define ALU_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface alu_if;
  // import types
  import cpu_types_pkg::*;

  aluop_t aluop;  
  logic   negative, zero, overflow;
  word_t  portA, portB, outputPort;
  
  // alu ports
  modport alu (
    input   portA, portB, aluop,
    output  negative, zero, overflow, outputPort
  );
  // alu tb
  modport tb (
    input   negative, zero, overflow, outputPort,
    output  portA, portB, aluop
  );
endinterface

`endif //ALU_IF_VH
