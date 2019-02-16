/*
  DuKe
  du139@purdue.edu

  pipeline register unit interface
*/
`ifndef PIPELINE_IF_VH
`define PIPELINE_IF_VH
// all types
`include "cpu_types_pkg.vh"

interface pipeline_if;
  // import types
  import cpu_types_pkg::*;

  //ifid vars
  word_t instructionin, instructionout, pcin, pcout;
  logic ihit, dhit, freeze, flush;
  
  // ifid ports
  modport ifid (
    input   instructionin, npcin, ihit, freeze, flush, pcin,
    output  instructionout, npcout, pcout
  );
  
  // idex vars
  word_t rdat1_in, rdat2_in, npcin, newpcin;
  logic dWEN_in, dREN_in, RegWEN_in, MemtoReg_in, halt_in, jal_in, bne_in, imemren_in;
  logic [1:0] ALUsrc_in;
  logic [2:0] Regdst_in, jsel_in;
  aluop_t aluop_in;
   
  word_t rdat1_out, rdat2_out, npcout, newpcout;
  logic dWEN_out, dREN_out, RegWEN_out, MemtoReg_out, halt_out, jal_out, bne_out, imemren_out;
  logic [1:0] ALUsrc_out;
  logic [2:0] Regdst_out, jsel_out;
  aluop_t aluop_out;
  
  //idex ports
  modport idex (
    input   instructionin, rdat1_in, rdat2_in, npcin, newpcin, dWEN_in, dREN_in, MemtoReg_in, RegWEN_in, jal_in, bne_in, ALUsrc_in, Regdst_in, jsel_in, aluop_in, ihit, halt_in, imemren_in, freeze, flush,
    output  instructionout, rdat1_out, rdat2_out, npcout, newpcout, dWEN_out, dREN_out, MemtoReg_out, RegWEN_out, jal_out, bne_out, ALUsrc_out, Regdst_out, jsel_out, halt_out, aluop_out, imemren_out
  );
  
  //exmem var
  word_t outputPort_in, outputPort_out;
  logic zero_in, zero_out;
  // exmem ports
  modport exmem (
    input   instructionin, rdat1_in, rdat2_in, dmemload_in, npcin, newpcin, ihit, dhit, outputPort_in, jsel_in, jal_in, bne_in, zero_in, dWEN_in, dREN_in, RegWEN_in, MemtoReg_in, Regdst_in, flush, halt_in,
    output  instructionout, rdat1_out, rdat2_out, dmemload_out, npcout, newpcout, outputPort_out, jsel_out, jal_out, bne_out, zero_out, dWEN_out, dREN_out, RegWEN_out,  MemtoReg_out, Regdst_out, halt_out
  );
  
  //memwb vars
  word_t dmemload_in, dmemload_out;
  //memwb
  modport memwb (
    input   instructionin, Regdst_in, ihit, dhit, dmemload_in, outputPort_in, jsel_in, npcin, newpcin, MemtoReg_in, RegWEN_in,  halt_in,
    output  instructionout, Regdst_out, dmemload_out, outputPort_out, jsel_out, npcout, newpcout, MemtoReg_out, RegWEN_out, halt_out
  );
  
  
endinterface

`endif //PIPELINE_IF_VH
