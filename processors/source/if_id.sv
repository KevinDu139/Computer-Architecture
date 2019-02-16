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

module if_id (
  input logic CLK, nRST,
  pipeline_if.ifid ifidif
);
    // import types
    import cpu_types_pkg::*;

    always_ff @(posedge CLK or negedge nRST)
    begin
        if (!nRST)
        begin
		ifidif.instructionout <= '0;
		ifidif.npcout <= 0;
		//ifidif.pcout <= 0;
        end
        else if(ifidif.flush && ifidif.ihit)
        begin
		ifidif.instructionout <= 0;
		ifidif.npcout <= 0;
		//ifidif.pcout <= 0;
        end
        else if (ifidif.ihit && ~ifidif.freeze)
	    begin
		ifidif.instructionout <= ifidif.instructionin;
		ifidif.npcout <= ifidif.npcin;
		//ifidif.pcout <= ifidif.pcin;
    	end
    end
endmodule
