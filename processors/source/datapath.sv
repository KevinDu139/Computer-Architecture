/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
`include "register_file_if.vh"
`include "alu_if.vh"
`include "control_unit_if.vh"
`include "pipeline_if.vh"
`include "hazard_unit_if.vh"
`include "forward_unit_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;


  register_file_if rfif();
  alu_if aluif();
  control_unit_if cuif();
  pipeline_if ifid();
  pipeline_if idex();
  pipeline_if exmem();
  pipeline_if memwb();
  hazard_unit_if huif();
  forward_unit_if fuif();

  register_file RF(CLK,nRST,rfif);
  alu ALU(aluif);
  control_unit CU(cuif);
  if_id IFID(CLK,nRST,ifid);
  id_ex IDEX(CLK,nRST,idex);
  ex_mem EXMEM(CLK,nRST,exmem);
  mem_wb MEMWB(CLK,nRST,memwb);
  hazard_unit HU(huif);
  forward_unit FU(fuif);

  logic [15:0] Imm;
  word_t pc, npc, newpc, branch, jump, portB;
  logic[2:0] port1, port2;
  //logic start;

  //assign start = pc == 0 ? 0 : 1;
  //assign newpc = (cuif.jsel == 0) ? npc : ((cuif.jsel == 1 || cuif.jal == 1) ? {ifid.npcout[31:28],ifid.instructionout[25:0],2'b00} : ((cuif.jsel == 2) ? rfif.rdat1 : branch)); //ifid - idex,  branchjump no work
  assign newpc = (exmem.jsel_out == 0) ? npc : ((exmem.jsel_out == 1 || exmem.jal_out == 1) ? {exmem.npcout[31:28], exmem.instructionout[25:0],2'b00} : ((exmem.jsel_out == 2) ? exmem.rdat1_out : branch)); //exmem - memwb   works, too long
  //assign newpc = (idex.jsel_out == 0) ? npc : ((idex.jsel_out == 1 || idex.jal_out == 1) ? {idex.npcout[31:28], idex.instructionout[25:0],2'b00} : ((idex.jsel_out == 2) ? idex.rdat1_out : branch)); //idex - exmem   doesn';t work

  assign npc = pc + 4;
  //assign npc = ifid.pcout + 4;
  always_ff @(posedge CLK, negedge nRST) 
  begin
	if(!nRST)
	begin
	    pc <= PC_INIT;
	end
	else
	begin
	  if(dpif.ihit == 1 && ~huif.freeze && !dpif.halt)//&& ~huif.flush)
	  begin
	    pc <= newpc;
	  end
	end
  end
  always_ff @(posedge CLK, negedge nRST) // latch for halt, once halt asserted, halt always = 1
  begin
	if(!nRST)
	begin
	    dpif.halt <= 0;
	end
	else
	begin
	  if(dpif.ihit == 1 && ~huif.freeze )//&& ~huif.flush)
	  begin
	    if(exmem.halt_out)
	    begin
	        dpif.halt <= 1;
	    end
	  end
	end
  end
  //datapath ports
  assign Imm = (idex.instructionout[15] == 1)? 16'hffff : 16'h0000;
  //assign jump = {Imm, ifid.instructionout[15:0]};            //ifid - idex,  branchjump no work
  assign jump = {16'h0000, exmem.instructionout[15:0]};    //exmem - memwb   works, too long
  //assign jump = {Imm, idex.instructionout[15:0]};       //idex - exmem  doesn';t work
  //logic zout;
  //logic bneout;
  word_t temp;
  logic branchok, jok;
  assign branchok = (exmem.bne_out == 1 ? ~exmem.zero_out : exmem.zero_out) && (exmem.jsel_out == 4);
  assign jok = (exmem.jsel_out == 1 || exmem.jal_out == 1);
  assign huif.branchok = branchok;
  assign huif.jok = jok;
  //word_t rdat1_out, rdat2_out;
  //assign rdat1_out = (fuif.port3 == 1)?aluif.outputPort:rfif.rdat1;
  //assign rdat2_out = (fuif.port3 == 2)?aluif.outputPort:rfif.rdat2;
  assign temp = {jump[29:0],2'b00};
  //assign zout = rdat1_out - rdat2_out == '0 ? 1 : 0;
  //assign zout = $signed(rfif.rdat1) - $signed(rfif.rdat2) == '0 ? 1 : 0;
  //assign bneout = (cuif.bne == 1 ? ~zout : zout);
  
  always_comb
  begin
	if((exmem.bne_out == 1 ? ~exmem.zero_out : exmem.zero_out) && (exmem.jsel_out == 4))
	//if((cuif.jsel == 4) && bneout)
	begin
	  branch = {exmem.npcout + temp};
	end
	else
	begin
	  branch = npc; //exmem.npcout;
	  //branch = ifid.npcout;;
	end

  end
  //assign branch = ((cuif.bne == 1 ? ~aluif.zero : aluif.zero) && (cuif.jsel == 4)) ? {npc + {jump[29:0],2'b00}} : npc;                                        //ifid - idex,  branchjump no work
  //assign branch = ((exmem.bne_out == 1 ? ~exmem.zero_out : exmem.zero_out) && (exmem.jsel_out == 4)) ? {exmem.npcout + {jump[29:0],2'b00}} : exmem.npcout;  //exmem - memwb   works, too long
  //assign branch = ((idex.bne_out == 1 ? ~aluif.zero : aluif.zero) && (idex.jsel_out == 4)) ? {idex.npcout + {jump[29:0],2'b00}} : idex.npcout;              //idex - exmem  doesn';t work

  assign dpif.imemREN = 1;
  assign dpif.dmemREN = exmem.dREN_out;
  assign dpif.dmemWEN = exmem.dWEN_out;
  assign dpif.dmemaddr = exmem.outputPort_out;
  assign dpif.dmemstore = exmem.rdat2_out;
  assign dpif.imemaddr = pc;

  //register ports
  assign rfif.rsel1 = ifid.instructionout[25:21]; // rs
  assign rfif.rsel2 = ifid.instructionout[20:16]; //rt           [15:11] rd
  assign rfif.WEN = memwb.RegWEN_out; 
  assign rfif.wsel = (memwb.Regdst_out == 0) ? memwb.instructionout[15:11] : ((memwb.Regdst_out == 1) ? memwb.instructionout[20:16] : 5'b11111); // ?? WB
  assign rfif.wdat = memwb.jsel_out == 5 ? {memwb.instructionout[15:0],16'b0} : ((memwb.jsel_out == 3) ? memwb.npcout : (memwb.MemtoReg_out ? memwb.dmemload_out : memwb.outputPort_out));


    //alu ports
  assign aluif.aluop = idex.aluop_out;
  //assign aluif.portA = idex.rdat1_out;
  assign portB = idex.ALUsrc_out == 0 ? idex.rdat2_out : (idex.ALUsrc_out == 1) ? {Imm,idex.instructionout[15:0]} : ((idex.ALUsrc_out == 2) ? {16'h0000,idex.instructionout[15:0]} : {'0,idex.instructionout[10:6]});

  //control unit ports
  assign cuif.instruction = ifid.instructionout;
  
  //foward unit ports
  assign fuif.rs = idex.instructionout[25:21];
  assign fuif.rt = (idex.instructionout[31:26] == RTYPE || idex.instructionout[31:26] == SW)?idex.instructionout[20:16]:0;
  assign fuif.rdm = (exmem.instructionout[31:26] == RTYPE)?exmem.instructionout[15:11]:exmem.instructionout[20:16];
  assign fuif.rdw = (memwb.instructionout[31:26] == RTYPE)?memwb.instructionout[15:11]:memwb.instructionout[20:16];
  assign fuif.exmemRW = exmem.RegWEN_out;
  assign fuif.memwbRW = memwb.RegWEN_out;
  assign fuif.idex_instr = idex.instructionout;
  assign fuif.exmem_instr = exmem.instructionout;
  assign fuif.memwb_instr = memwb.instructionout;
  assign port1 = fuif.port1; //idex.instructionout[31:26] != SW ? fuif.port1 : 0;
  assign port2 = fuif.port2;

  always_comb
  begin
    aluif.portA = 0;
    aluif.portB = 0;
  	if(port1 == 1)// && idex.instructionout[31:26] != SW)
	begin
		aluif.portA = exmem.outputPort_out;
	end
  	else if(port1 == 2)
	begin
		aluif.portA = rfif.wdat;
	end
	else if(port1 == 0)
	begin
  		aluif.portA = idex.rdat1_out;
	end
	else if(port1 == 3)
	begin
		aluif.portA = {exmem.instructionout[15:0],16'b0};
	end
	
  	if(port2 == 1)
	begin
		aluif.portB = exmem.outputPort_out;
	end
  	else if(port2 == 2)
	begin
		aluif.portB = rfif.wdat;
	end
	else
	begin
		aluif.portB = portB;
	end

  end
  //hazard unit ports
  /*assign huif.ifid_instr = ifid.instructionin;
  assign huif.idex_instr = idex.instructionin;
  assign huif.exmem_instr = exmem.instructionin;*/
  assign huif.ifid_instr = ifid.instructionout;
  assign huif.idex_instr = idex.instructionout;
  assign huif.exmem_instr = exmem.instructionout;
  //assign huif.jsel = cuif.jsel;
  assign huif.jsel = exmem.jsel_out;
  assign huif.dhit = dpif.dhit;
  //assign huif.start = start;
  //assign huif.RegWEN = cuif.RegWEN;
  
  // ifid
  assign ifid.instructionin = dpif.imemload;
  assign ifid.npcin = npc;
  //assign ifid.pcin = pc;
  assign ifid.ihit = dpif.ihit;
  assign ifid.freeze = huif.freeze;
  assign ifid.flush = huif.flush;

  //idex
  assign idex.ihit = dpif.ihit;
  assign idex.rdat1_in = rfif.rdat1;
  assign idex.rdat2_in = rfif.rdat2;
  assign idex.npcin = ifid.npcout;
  //assign idex.npcin = npc; 
  assign idex.newpcin = newpc;
  assign idex.dWEN_in = cuif.dWEN;
  assign idex.dREN_in = cuif.dREN;
  assign idex.RegWEN_in = cuif.RegWEN;
  assign idex.MemtoReg_in = cuif.MemtoReg;
  assign idex.halt_in = cuif.halt;
  assign idex.jal_in = cuif.jal;
  assign idex.bne_in = cuif.bne;
  assign idex.ALUsrc_in = cuif.ALUsrc;
  assign idex.Regdst_in = cuif.Regdst;
  assign idex.jsel_in = cuif.jsel;
  assign idex.aluop_in = cuif.aluop;
  assign idex.imemren_in = 1;
  assign idex.instructionin = ifid.instructionout;
  assign idex.flush = huif.flush;
  assign idex.freeze = huif.freeze;

  //exmem
  assign exmem.ihit = dpif.ihit;
  assign exmem.dhit = dpif.dhit;
  assign exmem.instructionin = idex.instructionout;
  assign exmem.rdat1_in = idex.rdat1_out;
  assign exmem.rdat2_in = (port2 == 3)? exmem.outputPort_out:(port2 == 4)?memwb.outputPort_out:(port2 == 5)? memwb.dmemload_out:idex.rdat2_out;
  assign exmem.RegWEN_in = idex.RegWEN_out;
  assign exmem.outputPort_in = aluif.outputPort;
  assign exmem.npcin = idex.npcout;  
  //assign exmem.newpcin = newpc;
  assign exmem.halt_in = idex.halt_out;
  assign exmem.newpcin = idex.newpcout;
  assign exmem.jsel_in = idex.jsel_out;
  assign exmem.jal_in = idex.jal_out;
  assign exmem.bne_in = idex.bne_out;
  assign exmem.zero_in = aluif.zero;
  assign exmem.dWEN_in = idex.dWEN_out;
  assign exmem.dREN_in = idex.dREN_out;
  assign exmem.MemtoReg_in = idex.MemtoReg_out;
  assign exmem.Regdst_in = idex.Regdst_out;
  assign exmem.dmemload_in = dpif.dmemload;
  assign exmem.flush = huif.flush;

  //memwb
  assign memwb.ihit = dpif.ihit;
  assign memwb.dhit = dpif.dhit;
  assign memwb.instructionin = exmem.instructionout;
  assign memwb.npcin = exmem.npcout;
  assign memwb.dREN = exmem.dREN_out;
  assign memwb.dWEN = exmem.dWEN_out;
  assign memwb.RegWEN_in = exmem.RegWEN_out;
  assign memwb.jsel_in = exmem.jsel_out;
  assign memwb.outputPort_in = exmem.outputPort_out;
  assign memwb.dmemload_in = (dpif.ihit && dpif.dhit) ? dpif.dmemload : exmem.dmemload_out;// exmem.dmemload_out;
  assign memwb.Regdst_in = exmem.Regdst_out;
  assign memwb.MemtoReg_in = exmem.MemtoReg_out;
  assign memwb.halt_in = exmem.halt_out;
  
  assign dpif.datomic = (exmem.instruction_out[31:26] == LL) || (exmem.instruction_out[31:26] == SC);
endmodule
