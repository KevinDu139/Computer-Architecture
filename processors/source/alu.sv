`include "alu_if.vh"
`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;
module alu
(
	alu_if.alu aluif
);
	assign aluif.negative = aluif.outputPort[31];
	assign aluif.zero = aluif.outputPort == '0 ? 1 : 0;
	always_comb 
	begin
		aluif.outputPort = '0; 
		aluif.overflow = 0;
		casez(aluif.aluop)
		ALU_SLL:
		begin
			aluif.outputPort = aluif.portB << aluif.portA;
		end
		ALU_SRL:
		begin
			aluif.outputPort = aluif.portB >> aluif.portA;
		end
		ALU_ADD:
		begin
			aluif.outputPort = $signed(aluif.portA) + $signed(aluif.portB);
			if((aluif.portA[31] == aluif.portB[31]) && (aluif.portA[31] != aluif.outputPort[31]))	
			begin
				aluif.overflow = 1;
			end
		end
		ALU_SUB:
		begin
			aluif.outputPort = $signed(aluif.portA) - $signed(aluif.portB);
			if((aluif.portA[31] != aluif.portB[31]) && (aluif.portA[31] != aluif.outputPort[31]))	
			begin
				aluif.overflow = 1;
			end
		end
		ALU_AND:
		begin
			aluif.outputPort = aluif.portA & aluif.portB;
		end
		ALU_OR:
		begin
			aluif.outputPort = aluif.portA | aluif.portB;
		end
		ALU_XOR:
		begin
			aluif.outputPort = aluif.portA ^ aluif.portB;
		end
		ALU_NOR:
		begin
			aluif.outputPort = ~(aluif.portA | aluif.portB);
		end
		ALU_SLT:
		begin
			aluif.outputPort = $signed(aluif.portA) < $signed(aluif.portB);
		end
		ALU_SLTU:
		begin
			aluif.outputPort = aluif.portA < aluif.portB;
		end
		endcase
	end
endmodule
