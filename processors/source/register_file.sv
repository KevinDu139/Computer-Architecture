`include "register_file_if.vh"
`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;
module register_file
(    
    input logic CLK, nRST,
	register_file_if.rf rfif
);
	
	word_t [31:0] register;
    always_ff @(negedge CLK or negedge nRST)
    begin
        if (!nRST)
        begin
			register <= '0;
        end
        else
		begin
			if(rfif.WEN && rfif.wsel != 0)
			begin
				register[rfif.wsel] <= rfif.wdat;
			end
    	end
	end
	assign rfif.rdat1 = register[rfif.rsel1];
	assign rfif.rdat2 = register[rfif.rsel2];
endmodule
