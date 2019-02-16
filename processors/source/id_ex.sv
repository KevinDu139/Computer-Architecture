/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "pipeline_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module id_ex (
  input logic CLK, nRST,
  pipeline_if.idex idexif
);
    // import types
    import cpu_types_pkg::*;

    always_ff @(posedge CLK or negedge nRST)
    begin
        if (!nRST)
        begin
		idexif.instructionout <= 0;
		idexif.rdat1_out <= 0;
		idexif.rdat2_out <= 0;
		idexif.npcout <= 0;
		idexif.newpcout <= 0;
		idexif.dWEN_out <= 0;
		idexif.dREN_out <= 0;
		idexif.RegWEN_out <= 0;
		idexif.MemtoReg_out <= 0;
		idexif.halt_out <= 0;
		idexif.jal_out <= 0;
		idexif.bne_out <= 0;
		idexif.ALUsrc_out <= 0;
		idexif.Regdst_out <= 0;
		idexif.jsel_out <= 0;
		idexif.aluop_out <= ALU_SLL;
		idexif.imemren_out <= 0;
	end
	else if ((idexif.freeze && idexif.ihit) || (idexif.flush && idexif.ihit))
    begin
		idexif.instructionout <= 0;
		idexif.rdat1_out <= 0;
		idexif.rdat2_out <= 0;
		idexif.npcout <= 0;
		idexif.newpcout <= 0;
		idexif.dWEN_out <= 0;
		idexif.dREN_out <= 0;
		idexif.RegWEN_out <= 0;
		idexif.MemtoReg_out <= 0;
		idexif.halt_out <= 0;
		idexif.jal_out <= 0;
		idexif.bne_out <= 0;
		idexif.ALUsrc_out <= 0;
		idexif.Regdst_out <= 0;
		idexif.jsel_out <= 0;
		idexif.aluop_out <= ALU_SLL;
		idexif.imemren_out <= 0;
	end
    else if (idexif.ihit)
	begin
		idexif.instructionout <= idexif.instructionin;
		idexif.rdat1_out <= idexif.rdat1_in;
		idexif.rdat2_out <= idexif.rdat2_in;
		idexif.npcout <= idexif.npcin;
		idexif.newpcout <= idexif.newpcin;
		idexif.dWEN_out <= idexif.dWEN_in;
		idexif.dREN_out <= idexif.dREN_in;
		idexif.RegWEN_out <= idexif.RegWEN_in;
		idexif.MemtoReg_out <= idexif.MemtoReg_in;
		idexif.halt_out <= idexif.halt_in;
		idexif.jal_out <= idexif.jal_in;
		idexif.bne_out <= idexif.bne_in;
		idexif.ALUsrc_out <= idexif.ALUsrc_in;
		idexif.Regdst_out <= idexif.Regdst_in;
		idexif.jsel_out <= idexif.jsel_in;
		idexif.aluop_out <= idexif.aluop_in;
		idexif.imemren_out <= idexif.imemren_in;
    	end
    end
endmodule
