/*
  DuKe
  du139@purdue.edu

  request unit interface
*/
`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;

  word_t instruction;
  logic dWEN, dREN, RegWEN, MemtoReg, halt, jal, bne;
  //regbits_t rs1, rs2, wdst;
  //logic [15:0] imm;
  logic [1:0] ALUsrc;
  logic [2:0] Regdst, jsel;
  aluop_t aluop;
  
  // alu ports
  modport cu (
    input   instruction,
    output  dWEN, dREN, RegWEN, MemtoReg, bne, halt, ALUsrc, Regdst, jsel, aluop, jal
  );
  // request unit tb
  //modport tb (
    //input   
    //output  
  //);
endinterface

`endif //CONTROL_UNIT_IF_VH
