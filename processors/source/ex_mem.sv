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

module ex_mem (
  input logic CLK, nRST,
  pipeline_if.exmem exmemif
);
    // import types
    import cpu_types_pkg::*;

    always_ff @(posedge CLK or negedge nRST)
    begin
        if (!nRST)
        begin      
            exmemif.instructionout <= 0; 
		    exmemif.rdat1_out <= 0;
		    exmemif.rdat2_out <= 0; 
		    exmemif.npcout <= 0;
		    exmemif.newpcout <= 0;
		    exmemif.outputPort_out <= 0;
		    exmemif.jsel_out <= 0;
		    exmemif.jal_out <= 0;
		    exmemif.bne_out <= 0;
		    exmemif.zero_out <= 0;
		    exmemif.dWEN_out <= 0;
		    exmemif.dREN_out <= 0;
		    exmemif.RegWEN_out <= 0;
		    exmemif.MemtoReg_out <= 0;
		    exmemif.Regdst_out <= 0;
		    exmemif.halt_out <= 0;
		    exmemif.dmemload_out <=0;
	    end
	    else if ((exmemif.flush && exmemif.ihit))
        begin      
            exmemif.instructionout <= 0; 
		    exmemif.rdat1_out <= 0;
		    exmemif.rdat2_out <= 0; 
		    exmemif.npcout <= 0;
		    exmemif.newpcout <= 0;
		    exmemif.outputPort_out <= 0;
		    exmemif.jsel_out <= 0;
		    exmemif.jal_out <= 0;
		    exmemif.bne_out <= 0;
		    exmemif.zero_out <= 0;
		    exmemif.dWEN_out <= 0;
		    exmemif.dREN_out <= 0;
		    exmemif.RegWEN_out <= 0;
		    exmemif.MemtoReg_out <= 0;
		    exmemif.Regdst_out <= 0;
		    exmemif.halt_out <= 0;
		    exmemif.dmemload_out <=0;
	    end
	    else if (exmemif.dhit && !exmemif.ihit)
	    begin
		    exmemif.dWEN_out <= 0;
		    exmemif.dREN_out <= 0;	
		    exmemif.dmemload_out <= exmemif.dmemload_in;	    
        end
	    else if (exmemif.ihit && !exmemif.dhit)
	    begin        
		    exmemif.instructionout <= exmemif.instructionin;
		    exmemif.rdat1_out <= exmemif.rdat1_in;
		    exmemif.rdat2_out <= exmemif.rdat2_in;
		    exmemif.npcout <= exmemif.npcin;
		    exmemif.newpcout <= exmemif.newpcin;
		    exmemif.outputPort_out <= exmemif.outputPort_in;
		    exmemif.jsel_out <= exmemif.jsel_in;
		    exmemif.jal_out <= exmemif.jal_in;
		    exmemif.bne_out <= exmemif.bne_in;
		    exmemif.zero_out <= exmemif.zero_in;
		    exmemif.dWEN_out <= exmemif.dWEN_in;
		    exmemif.dREN_out <= exmemif.dREN_in;
		    exmemif.RegWEN_out <= exmemif.RegWEN_in;
		    exmemif.MemtoReg_out <= exmemif.MemtoReg_in;
		    exmemif.Regdst_out <= exmemif.Regdst_in;
		    exmemif.halt_out <= exmemif.halt_in;
    	end
	    else if (exmemif.ihit && exmemif.dhit)
	    begin        
		    exmemif.instructionout <= exmemif.instructionin;
		    exmemif.rdat1_out <= exmemif.rdat1_in;
		    exmemif.rdat2_out <= exmemif.rdat2_in;
		    exmemif.npcout <= exmemif.npcin;
		    exmemif.newpcout <= exmemif.newpcin;
		    exmemif.outputPort_out <= exmemif.outputPort_in;
		    exmemif.jsel_out <= exmemif.jsel_in;
		    exmemif.jal_out <= exmemif.jal_in;
		    exmemif.bne_out <= exmemif.bne_in;
		    exmemif.zero_out <= exmemif.zero_in;
		    exmemif.dWEN_out <= exmemif.dWEN_in;
		    exmemif.dREN_out <= exmemif.dREN_in;
		    exmemif.RegWEN_out <= exmemif.RegWEN_in;
		    exmemif.MemtoReg_out <= exmemif.MemtoReg_in;
		    exmemif.Regdst_out <= exmemif.Regdst_in;
		    exmemif.halt_out <= exmemif.halt_in;
		    exmemif.dmemload_out <= exmemif.dmemload_in;	
    	end
    end
endmodule
