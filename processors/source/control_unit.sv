/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "control_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module control_unit (
  control_unit_if.cu cuif
);
  // import types
  import cpu_types_pkg::*;

  always_comb
  begin
  cuif.dWEN = 0;
  cuif.dREN = 0;
  cuif.RegWEN = 0;
  cuif.MemtoReg = 0;
  cuif.bne = 0;
  cuif.halt = 0;
  cuif.ALUsrc = 0;
  cuif.Regdst = 0;
  cuif.jsel = 0;
  cuif.jal = 0;
  cuif.aluop = ALU_SLL;
  
  if(cuif.instruction[31:26] == RTYPE)
  begin
	cuif.Regdst = 0;
	if(cuif.instruction[5:0] == JR)
	begin
		cuif.RegWEN = 0;
	end
	else
	begin
		cuif.RegWEN = 1;
	end
	case(cuif.instruction[5:0])
		SLLV:
		begin
			cuif.aluop = ALU_SLL;
		end
		SRLV:
		begin
			cuif.aluop = ALU_SRL;
		end
		JR:
		begin
			cuif.jsel = 2;
		end
		ADD:
		begin
			cuif.aluop = ALU_ADD;
		end
		ADDU:
		begin
			cuif.aluop = ALU_ADD;
		end
		SUB:
		begin
			cuif.aluop = ALU_SUB;
		end
		SUBU:
		begin
			cuif.aluop = ALU_SUB;
		end
		AND:
		begin
			cuif.aluop = ALU_AND;
		end
		OR:
		begin
			cuif.aluop = ALU_OR;
		end
		XOR:
		begin
			cuif.aluop = ALU_XOR;
		end
		NOR:
		begin
			cuif.aluop = ALU_NOR;
		end
		SLT:
		begin
			cuif.aluop = ALU_SLT;
		end
		SLTU:
		begin
			cuif.aluop = ALU_SLTU;
		end
  	endcase
  end
  if(cuif.instruction[31:26] != RTYPE && cuif.instruction[31:26] != J && cuif.instruction[31:26] != JAL)
  begin
  	  cuif.Regdst = 1;
  end
  if(cuif.instruction[31:26] == J)
  begin
    	cuif.jsel = 1;
	    cuif.RegWEN = 0;
  end
  if(cuif.instruction[31:26] == JAL)
  begin
    	cuif.jsel = 3;
	    cuif.jal = 1;
	    cuif.RegWEN = 1;
	    cuif.Regdst = 2;
  end
  if(cuif.instruction[31:26] == BEQ)
  begin
    	cuif.aluop = ALU_SUB;
	    cuif.RegWEN = 0;
    	cuif.jsel = 4;
  end
  if(cuif.instruction[31:26] == BNE)
  begin
    	cuif.aluop = ALU_SUB;
	    cuif.RegWEN = 0;
	    cuif.bne = 1;
    	cuif.jsel = 4;
  end
  if(cuif.instruction[31:26] == ADDI)
  begin
    	cuif.aluop = ALU_ADD;
	    cuif.ALUsrc = 1;
	    cuif.RegWEN = 1;
  end
  if(cuif.instruction[31:26] == ADDIU)
  begin
    	cuif.aluop = ALU_ADD;
	    cuif.ALUsrc = 1;
	    cuif.RegWEN = 1;
  end
  if(cuif.instruction[31:26] == SLTI)
  begin
    	cuif.aluop = ALU_SLT;
	    cuif.ALUsrc = 1;
	    cuif.RegWEN = 1;
  end
  if(cuif.instruction[31:26] == SLTIU)
  begin
    	cuif.aluop = ALU_SLT;
	    cuif.ALUsrc = 1;
	    cuif.RegWEN = 1;
  end
  if(cuif.instruction[31:26] == ANDI)
  begin
    	cuif.aluop = ALU_AND;
	    cuif.ALUsrc = 2;
	    cuif.RegWEN = 1;
  end
  if(cuif.instruction[31:26] == ORI)
  begin
  	  cuif.aluop = ALU_OR;
	    cuif.ALUsrc = 2;
	    cuif.RegWEN = 1;
  end
  if(cuif.instruction[31:26] == XORI)
  begin
    	cuif.aluop = ALU_XOR;
	    cuif.ALUsrc = 2;
	    cuif.RegWEN = 1;
  end
  if(cuif.instruction[31:26] == LUI)
  begin
	    cuif.jsel = 5;
	    cuif.RegWEN = 1;
  end
  if(cuif.instruction[31:26] == LW)
  begin
    	cuif.aluop = ALU_ADD;
	    cuif.ALUsrc = 1;
	    cuif.RegWEN = 1;
	    cuif.MemtoReg = 1;
	    cuif.dREN = 1;
  end
  if(cuif.instruction[31:26] == SW)
  begin
    	cuif.aluop = ALU_ADD;
	    cuif.ALUsrc = 1;
	    cuif.dWEN = 1;
  end
  if(cuif.instruction[31:26] == HALT)
  begin
  	  cuif.halt = 1;
  end
  if(cuif.instruction[31:26] == LL)
  begin
	    cuif.aluop = ALU_ADD;
	    cuif.ALUsrc = 1;
	    cuif.RegWEN = 1;// check example.asm
	    cuif.MemtoReg = 1;
	    cuif.dREN = 1;
  end
  if(cuif.instruction[31:26] == SC)
  begin
    	cuif.aluop = ALU_ADD;
	    cuif.ALUsrc = 1;
	    cuif.RegWEN = 1;
	    cuif.MemtoReg = 1;
	    cuif.dWEN = 1;
  end
end
endmodule
