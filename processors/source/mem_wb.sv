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

module mem_wb (
  input logic CLK, nRST,
  pipeline_if.memwb memwbif
);
    // import types
    import cpu_types_pkg::*;

    always_ff @(posedge CLK or negedge nRST)
    begin
        if (!nRST)
        begin        
		memwbif.instructionout <= 0;
		memwbif.npcout <= 0;
		memwbif.newpcout <= 0;
		memwbif.jsel_out <= 0;
		memwbif.outputPort_out <= 0;
		memwbif.dmemload_out <= 0;
		memwbif.Regdst_out <= 0;
		memwbif.RegWEN_out <= 0;
		memwbif.MemtoReg_out <= 0;
		memwbif.halt_out <= 0;
	end
	else if (memwbif.ihit)
	begin   
		memwbif.instructionout <= memwbif.instructionin;
		memwbif.npcout <= memwbif.npcin;
		memwbif.newpcout <= memwbif.newpcin;
		memwbif.jsel_out <= memwbif.jsel_in;
		memwbif.outputPort_out <= memwbif.outputPort_in;
		memwbif.dmemload_out <= memwbif.dmemload_in;
		memwbif.Regdst_out <= memwbif.Regdst_in;
		memwbif.RegWEN_out <= memwbif.RegWEN_in;
		memwbif.MemtoReg_out <= memwbif.MemtoReg_in;
		memwbif.halt_out <= memwbif.halt_in;
    	
    end 
    end 
endmodule
